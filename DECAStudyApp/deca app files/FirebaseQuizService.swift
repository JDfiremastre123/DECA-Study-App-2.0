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

    // Fetches questions for whichever cluster the user selected.
    // Firebase structure expected:
    // questions
    //   some-question-id
    //     cluster: "marketing" OR "businessMgmt" OR "finance" etc.
    //     question: "..."
    //     options: ["A", "B", "C", "D"]
    //     correctIndex: 0/1/2/3
    //     correctAnswer: "..."
    //     explanation: "..."
    func fetchQuestions(for cluster: ExamCluster, completion: @escaping (Result<[QuizQuestion], Error>) -> Void) {
        let ref = Database
            .database(url: databaseURL)
            .reference()
            .child("questions")

        ref.observeSingleEvent(of: .value) { snapshot in
            print("Firebase path exists:", snapshot.exists())
            print("Firebase children count:", snapshot.childrenCount)
            print("Selected cluster:", cluster.firebaseKey)

            var questions: [QuizQuestion] = []

            for child in snapshot.children {
                guard
                    let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String: Any]
                else {
                    continue
                }

                let firebaseID = childSnapshot.key

                guard let parsedCluster = self.parseCluster(from: dict), parsedCluster == cluster else {
                    continue
                }

                if let quizQuestion = self.parseQuestion(from: dict, firebaseID: firebaseID, cluster: parsedCluster) {
                    questions.append(quizQuestion)
                } else {
                    print("Could not parse question:", dict)
                }
            }

            if questions.isEmpty {
                completion(.failure(FirebaseQuizError.noQuestionsFound(cluster.rawValue)))
            } else {
                completion(.success(questions))
            }

        } withCancel: { error in
            completion(.failure(error))
        }
    }

    // Optional wrapper so older code still compiles if anything still calls this.
    func fetchMarketingQuestions(completion: @escaping (Result<[QuizQuestion], Error>) -> Void) {
        fetchQuestions(for: .marketing, completion: completion)
    }

    private func parseQuestion(from dict: [String: Any], firebaseID: String, cluster: ExamCluster) -> QuizQuestion? {
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

        let idText = dict["id"] as? String ?? firebaseID
        let questionID = UUID(uuidString: idText) ?? UUID()

        return QuizQuestion(
            id: questionID,
            question: questionText,
            options: options,
            correctIndex: correctIndex,
            explanation: explanation,
            cluster: cluster
        )
    }

    private func parseCluster(from dict: [String: Any]) -> ExamCluster? {
        guard let clusterText = dict["cluster"] as? String else {
            return nil
        }

        let normalized = normalize(clusterText)

        for cluster in ExamCluster.allCases {
            if normalized == normalize(cluster.firebaseKey) || normalized == normalize(cluster.rawValue) {
                return cluster
            }
        }

        switch normalized {
        case "businessadmin", "businessadministration", "businessadministrationcore", "bac":
            return .businessAdmin
        case "businessmgmt", "businessmanagement", "businessmanagementadministration", "businessmanagementandadministration", "bma":
            return .businessMgmt
        case "entre", "entrepreneurship", "entrepreneurshipexam":
            return .entrepreneurship
        case "finance", "fin":
            return .finance
        case "hospitality", "hospitalitytourism", "hospitalityandtourism":
            return .hospitality
        case "marketing", "mktg":
            return .marketing
        case "personalfinance", "personalfinancialliteracy", "pfl":
            return .personalFinance
        default:
            print("Unknown cluster value in Firebase:", clusterText)
            return nil
        }
    }

    private func normalize(_ value: String) -> String {
        value
            .lowercased()
            .filter { $0.isLetter || $0.isNumber }
    }

    private func parseOptions(from dict: [String: Any]) -> [String] {
        if let options = dict["options"] as? [String] {
            return options
        }

        if let options = dict["options"] as? [Any] {
            return options.compactMap { $0 as? String }
        }

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

        if let correctIndexNumber = dict["correctIndex"] as? NSNumber {
            return correctIndexNumber.intValue
        }

        if let correctIndexString = dict["correctIndex"] as? String,
           let correctIndex = Int(correctIndexString) {
            return correctIndex
        }

        if let correctAnswer = dict["correctAnswer"] as? String {
            let answer = correctAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
            let lowerAnswer = answer.lowercased()

            switch lowerAnswer {
            case "a": return 0
            case "b": return 1
            case "c": return 2
            case "d": return 3
            default:
                if let index = options.firstIndex(where: {
                    $0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == lowerAnswer
                }) {
                    return index
                }
            }
        }

        return -1
    }
}

enum FirebaseQuizError: LocalizedError {
    case noQuestionsFound(String)

    var errorDescription: String? {
        switch self {
        case .noQuestionsFound(let clusterName):
            return "No quiz questions were found in Firebase for \(clusterName)."
        }
    }
}

