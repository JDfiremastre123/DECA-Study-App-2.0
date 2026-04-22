//
//  Models.swift
//  DECA Study App
//

import Foundation

// MARK: - Exam Cluster
enum ExamCluster: String, CaseIterable, Identifiable {
    case businessAdmin       = "Business Administration"
    case businessMgmt        = "Business Management & Administration"
    case entrepreneurship    = "Entrepreneurship"
    case finance             = "Finance"
    case hospitality         = "Hospitality & Tourism"
    case marketing           = "Marketing"
    case personalFinance     = "Personal Financial Literacy"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .businessAdmin:    return "cube.fill"
        case .businessMgmt:    return "briefcase.fill"
        case .entrepreneurship: return "lightbulb.fill"
        case .finance:         return "dollarsign.circle.fill"
        case .hospitality:     return "globe"
        case .marketing:       return "iphone.gen2"
        case .personalFinance: return "creditcard.fill"
        }
    }

    var isAvailable: Bool {
        self == .marketing
    }
}

// MARK: - Quiz Question
struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]        // exactly 4 options
    let correctIndex: Int        // 0-based
    let explanation: String
    let cluster: ExamCluster
}

// MARK: - Study Term
struct StudyTerm: Identifiable {
    let id = UUID()
    let term: String
    let definition: String
    let example: String
    let category: String         // sub-topic header
    let cluster: ExamCluster
}

// MARK: - Quiz Length
enum QuizLength: Int, CaseIterable {
    case ten    = 10
    case twentyFive = 25
    case fifty  = 50
    case hundred = 100

    var label: String { "\(rawValue) Questions" }
}
