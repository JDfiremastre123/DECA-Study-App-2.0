//
//  FirebaseQuizService.swift
//  DECA Study App
//

import Foundation
import FirebaseDatabase

final class FirebaseQuizService {

    static let shared = FirebaseQuizService()

    private init() {}

    private let databaseURL = "https://deca-study-app-2ab33-default-rtdb.firebaseio.com"

    func fetchMarketingQuestions(completion: @escaping (Result<[QuizQuestion], Error>) -> Void) {
        let ref = Database
            .database(url: databaseURL)
            .reference()
            .child("questions")

        ref.observeSingleEvent(of: .value) { snapshot in
            print("Firebase path exists:", snapshot.exists())
            print("Firebase children count:", snapshot.childrenCount)

            var questions: [QuizQuestion] = []

            for child in snapshot.children {
                guard
                    let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String: Any]
                else {
                    continue
                }

                guard let clusterText = dict["cluster"] as? String,
                      clusterText.lowercased() == "marketing" else {
                    continue
                }

                if let quizQuestion = self.parseQuestion(from: dict) {
                    questions.append(quizQuestion)
                } else {
                    print("Could not parse question:", dict)
                }
            }

            if questions.isEmpty {
                completion(.failure(FirebaseQuizError.noQuestionsFound))
            } else {
                completion(.success(questions))
            }

        } withCancel: { error in
            completion(.failure(error))
        }
    }

    private func parseQuestion(from dict: [String: Any]) -> QuizQuestion? {
        guard let questionText = dict["question"] as? String else {
            return nil
        }

        let explanation = dict["explanation"] as? String ?? ""

        let options = parseOptions(from: dict)

        guard options.count == 4 else {
            print("Options were not 4:", options)
            return nil
        }

        let correctIndex = parseCorrectIndex(from: dict, options: options)

        guard correctIndex >= 0, correctIndex < options.count else {
            print("Invalid correctIndex:", correctIndex)
            return nil
        }

        return QuizQuestion(
            question: questionText,
            options: options,
            correctIndex: correctIndex,
            explanation: explanation,
            cluster: .marketing
        )
    }

    private func parseOptions(from dict: [String: Any]) -> [String] {
        // Case 1: options saved as Swift/Firebase array
        if let options = dict["options"] as? [String] {
            return options
        }

        // Case 2: options saved as array of Any
        if let options = dict["options"] as? [Any] {
            return options.compactMap { $0 as? String }
        }

        // Case 3: options saved as dictionary, like:
        // options: { 0: "...", 1: "...", 2: "...", 3: "..." }
        if let optionsDict = dict["options"] as? [String: Any] {
            let sortedKeys = optionsDict.keys.sorted { key1, key2 in
                let int1 = Int(key1) ?? 999
                let int2 = Int(key2) ?? 999
                return int1 < int2
            }

            let options = sortedKeys.compactMap { key in
                optionsDict[key] as? String
            }

            if options.count == 4 {
                return options
            }
        }

        // Case 4: fallback if fields are named optionA, optionB, optionC, optionD
        let optionA = dict["optionA"] as? String
        let optionB = dict["optionB"] as? String
        let optionC = dict["optionC"] as? String
        let optionD = dict["optionD"] as? String

        return [optionA, optionB, optionC, optionD].compactMap { $0 }
    }

    private func parseCorrectIndex(from dict: [String: Any], options: [String]) -> Int {
        // Your Firebase already has correctIndex: 2
        if let correctIndex = dict["correctIndex"] as? Int {
            return correctIndex
        }

        if let correctIndexNumber = dict["correctIndex"] as? NSNumber {
            return correctIndexNumber.intValue
        }

        if let correctIndexString = dict["correctIndex"] as? String,
           let correctIndex = Int(correctIndexString) {
            return correctIndex
        }

        // Fallback: match correctAnswer text to one of the options
        if let correctAnswer = dict["correctAnswer"] as? String {
            let cleanedAnswer = correctAnswer
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()

            if let index = options.firstIndex(where: {
                $0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == cleanedAnswer
            }) {
                return index
            }
        }

        return -1
    }
}

enum FirebaseQuizError: LocalizedError {
    case noQuestionsFound

    var errorDescription: String? {
        switch self {
        case .noQuestionsFound:
            return "No quiz questions were found in Firebase."
        }
    }
}
