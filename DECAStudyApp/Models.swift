//
//  Models.swift
//  DECA Study App
//

import Foundation
import SwiftUICore

// MARK: - Exam Cluster
// Added Codable here!
enum ExamCluster: String, CaseIterable, Identifiable, Codable {
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
        case .businessMgmt:     return "briefcase.fill"
        case .entrepreneurship: return "lightbulb.fill"
        case .finance:          return "dollarsign.circle.fill"
        case .hospitality:      return "globe"
        case .marketing:        return "iphone.gen2"
        case .personalFinance:  return "creditcard.fill"
        }
    }
    
    var color: Color {
        switch self {
        // Divide by 255.0 to get the correct 0.0 - 1.0 range
        case .businessAdmin: return Color(red: 28/255, green: 60/255, blue: 99/255)
        case .businessMgmt: return .yellow
        case .entrepreneurship: return .gray
        case .finance: return .green
        case .hospitality: return .blue
        case .marketing: return .red
        case .personalFinance: return Color(red: 145/255, green: 197/255, blue: 90/255)
        }
    }

    var isAvailable: Bool {
        self == .marketing
    }
}

// MARK: - Quiz Question
struct QuizQuestion: Identifiable, Codable {
    let id: UUID
    let question: String
    let options: [String]        // exactly 4 options
    let correctIndex: Int        // 0-based
    let explanation: String
    let cluster: ExamCluster

    init(id: UUID = UUID(), question: String, options: [String],
         correctIndex: Int, explanation: String, cluster: ExamCluster) {
        self.id = id
        self.question = question
        self.options = options
        self.correctIndex = correctIndex
        self.explanation = explanation
        self.cluster = cluster
    }
}

// MARK: - Exam Record  (persisted exam history entry)
struct ExamRecord: Identifiable, Codable {
    let id: UUID
    let date: Date
    let cluster: ExamCluster
    let score: Int
    let total: Int
    let missedQuestions: [QuizQuestion]   // only wrong answers stored

    var percentage: Double { Double(score) / Double(total) * 100 }

    var gradeLetter: String {
        switch percentage {
        case 90...100: return "A"
        case 80..<90:  return "B"
        case 70..<80:  return "C"
        case 60..<70:  return "D"
        default:       return "F"
        }
    }

    init(id: UUID = UUID(), date: Date = Date(), cluster: ExamCluster,
         score: Int, total: Int, missedQuestions: [QuizQuestion]) {
        self.id = id
        self.date = date
        self.cluster = cluster
        self.score = score
        self.total = total
        self.missedQuestions = missedQuestions
    }
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

