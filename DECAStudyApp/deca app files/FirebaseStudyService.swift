//
//  FirebaseStudyService.swift
//  DECA Study App
//

import Foundation
import FirebaseDatabase

final class FirebaseStudyService {

    static let shared = FirebaseStudyService()

    private init() {}

    private let databaseURL = "https://deca-study-app-2ab33-default-rtdb.firebaseio.com"

    // Firebase structure expected:
    // studyTerms
    //   some-term-id
    //     cluster: "marketing" OR "businessMgmt" OR "finance" etc.
    //     term: "Marketing Mix"
    //     definition: "..."
    //     example: "..."
    //     category: "Marketing Fundamentals"
    func fetchStudyTerms(for cluster: ExamCluster, completion: @escaping (Result<[StudyTerm], Error>) -> Void) {
        let ref = Database
            .database(url: databaseURL)
            .reference()
            .child("terms")

        ref.observeSingleEvent(of: .value) { snapshot in
            print("Study terms path exists:", snapshot.exists())
            print("Study terms children count:", snapshot.childrenCount)
            print("Selected study cluster:", cluster.firebaseKey)

            var terms: [StudyTerm] = []

            for child in snapshot.children {
                guard
                    let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String: Any]
                else {
                    continue
                }

                guard let parsedCluster = self.parseCluster(from: dict), parsedCluster == cluster else {
                    continue
                }

                if let term = self.parseStudyTerm(from: dict, cluster: parsedCluster) {
                    terms.append(term)
                } else {
                    print("Could not parse study term:", dict)
                }
            }

            if terms.isEmpty {
                completion(.failure(FirebaseStudyError.noStudyTermsFound(cluster.rawValue)))
            } else {
                let sortedTerms = terms.sorted {
                    if $0.category == $1.category {
                        return $0.term.localizedCaseInsensitiveCompare($1.term) == .orderedAscending
                    }
                    return $0.category.localizedCaseInsensitiveCompare($1.category) == .orderedAscending
                }
                completion(.success(sortedTerms))
            }

        } withCancel: { error in
            completion(.failure(error))
        }
    }

    private func parseStudyTerm(from dict: [String: Any], cluster: ExamCluster) -> StudyTerm? {
        // Supports multiple possible spreadsheet/Firebase field names.
        guard let term = stringValue(from: dict, keys: ["term", "keyTerm", "key_term", "Term", "Key Term"]) else {
            return nil
        }

        let definition = stringValue(from: dict, keys: ["definition", "Definition", "meaning", "Meaning"]) ?? ""
        let example = stringValue(from: dict, keys: ["example", "Example", "sentence", "Sentence"]) ?? ""
        let category = stringValue(from: dict, keys: ["category", "Category", "section", "Section", "topic", "Topic"]) ?? cluster.rawValue

        return StudyTerm(
            term: term,
            definition: definition,
            example: example,
            category: category,
            cluster: cluster
        )
    }

    private func stringValue(from dict: [String: Any], keys: [String]) -> String? {
        for key in keys {
            if let value = dict[key] as? String {
                let cleaned = value.trimmingCharacters(in: .whitespacesAndNewlines)
                if !cleaned.isEmpty { return cleaned }
            }
        }
        return nil
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
            print("Unknown study term cluster value in Firebase:", clusterText)
            return nil
        }
    }

    private func normalize(_ value: String) -> String {
        value
            .lowercased()
            .filter { $0.isLetter || $0.isNumber }
    }
}

enum FirebaseStudyError: LocalizedError {
    case noStudyTermsFound(String)

    var errorDescription: String? {
        switch self {
        case .noStudyTermsFound(let clusterName):
            return "No study terms were found in Firebase for \(clusterName)."
        }
    }
}

