//
//  SettingsManager.swift
//  DECA Study App
//

import SwiftUI

class SettingsManager: ObservableObject {
    @AppStorage("textSize") var textSize: Double = 16.0
    @AppStorage("darkMode") var darkMode: Bool   = false
    
        @Published var playerName: String = ""
        @Published var isDarkMode: Bool = false

    // MARK: - Exam History
    @Published private(set) var examHistory: [ExamRecord] = []

    private let historyKey = "examHistory"

    init() {
        loadHistory()
    }

    // MARK: - Persistence helpers
    func saveExam(_ record: ExamRecord) {
        examHistory.insert(record, at: 0)   // newest first
        persistHistory()
    }

    func deleteExam(at offsets: IndexSet) {
        examHistory.remove(atOffsets: offsets)
        persistHistory()
    }

    func clearAllHistory() {
        examHistory.removeAll()
        persistHistory()
    }

    private func persistHistory() {
        if let data = try? JSONEncoder().encode(examHistory) {
            UserDefaults.standard.set(data, forKey: historyKey)
        }
    }

    private func loadHistory() {
        guard
            let data = UserDefaults.standard.data(forKey: historyKey),
            let records = try? JSONDecoder().decode([ExamRecord].self, from: data)
        else { return }
        examHistory = records
    }
}

