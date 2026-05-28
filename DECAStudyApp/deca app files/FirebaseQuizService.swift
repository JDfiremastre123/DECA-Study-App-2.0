//
//  FirebaseQuizService.swift
//  DECA Study App
//

import Foundation
import FirebaseDatabase

final class FirebaseQuizService {

    static let shared = FirebaseQuizService()

    private init() {}

    // Use this if Firebase does not automatically pick up your Realtime Database URL.
    // Check the exact URL in Firebase Console > Realtime Database.
    private let databaseURL = "https://deca-study-app-2ab33-default-rtdb.firebaseio.com"

    func fetchMarketingQuestions(completion: @escaping (Result<[QuizQuestion], Error>) -> Void) {
        let ref = Database
            .database(url: databaseURL)
            .reference()
            .child("exams")
            .child("marketing")
            .child("questions")

        ref.observeSingleEvent(of: .value) { snapshot in
            var questions: [QuizQuestion] = []

            for child in snapshot.children {
                guard
                    let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String: Any],
                    let quizQuestion = self.parseQuestion(from: dict)
                else {
                    continue
                }

                questions.append(quizQuestion)
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
            return nil
        }

        let correctIndex = parseCorrectIndex(from: dict, options: options)

        guard correctIndex >= 0, correctIndex < options.count else {
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
        if let options = dict["options"] as? [String], options.count == 4 {
            return options
        }

        let optionA = dict["optionA"] as? String ?? dict["A"] as? String ?? dict["a"] as? String
        let optionB = dict["optionB"] as? String ?? dict["B"] as? String ?? dict["b"] as? String
        let optionC = dict["optionC"] as? String ?? dict["C"] as? String ?? dict["c"] as? String
        let optionD = dict["optionD"] as? String ?? dict["D"] as? String ?? dict["d"] as? String

        return [optionA, optionB, optionC, optionD].compactMap { $0 }
    }

    private func parseCorrectIndex(from dict: [String: Any], options: [String]) -> Int {
        if let correctIndex = dict["correctIndex"] as? Int {
            return correctIndex
        }

        if let correctIndexString = dict["correctIndex"] as? String,
           let correctIndex = Int(correctIndexString) {
            return correctIndex
        }

        if let correctAnswer = dict["correctAnswer"] as? String {
            let answer = correctAnswer.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

            switch answer {
            case "A": return 0
            case "B": return 1
            case "C": return 2
            case "D": return 3
            default:
                if let matchingIndex = options.firstIndex(where: {
                    $0.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() == answer
                }) {
                    return matchingIndex
                }
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
