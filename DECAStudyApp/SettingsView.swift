//
//  SettingsView.swift
//  DECA Study App
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: SettingsManager

    @State private var showClearConfirm = false
    @State private var selectedRecord: ExamRecord? = nil

    var body: some View {
        ZStack(alignment: .top) {
            Color.blue.ignoresSafeArea()

            VStack(spacing: 0) {
                // ── Header ───────────────────────────────────────────────
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "arrowshape.backward.circle")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Settings")
                        .font(.title2).fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.6))
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 24)

                // ── Content ───────────────────────────────────────────────
                ScrollView {
                    VStack(spacing: 20) {

                        // ── Display settings ─────────────────────────────
                        VStack(spacing: 14) {
                            // Text size slider
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: "textformat.size")
                                        .foregroundColor(.gray)
                                        .frame(width: 24)
                                    Text("Text Size: \(Int(settings.textSize))pt")
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Text("Sample Text")
                                        .font(.system(size: CGFloat(settings.textSize)))
                                        .foregroundColor(.secondary)
                                }
                                Slider(value: $settings.textSize, in: 12...22, step: 1)
                                    .tint(.blue)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color(.systemBackground))
                            )

                            // Dark mode toggle
                            HStack {
                                Image(systemName: settings.darkMode ? "moon.fill" : "sun.max.fill")
                                    .foregroundColor(settings.darkMode ? .yellow : .orange)
                                    .frame(width: 24)
                                Text(settings.darkMode ? "Dark Mode" : "Light Mode")
                                    .foregroundColor(.primary)
                                Spacer()
                                Toggle("", isOn: $settings.darkMode)
                                    .labelsHidden()
                                    .tint(.blue)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color(.systemBackground))
                            )
                        }

                        // ── Exam History header ───────────────────────────
                        HStack {
                            Text("Exam History")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                            Spacer()
                            if !settings.examHistory.isEmpty {
                                Button(action: { showClearConfirm = true }) {
                                    Text("Clear All")
                                        .font(.caption).fontWeight(.semibold)
                                        .foregroundColor(.white.opacity(0.75))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.white.opacity(0.2))
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal, 4)

                        // ── Exam records list ─────────────────────────────
                        if settings.examHistory.isEmpty {
                            VStack(spacing: 12) {
                                Image(systemName: "doc.text.magnifyingglass")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white.opacity(0.4))
                                Text("No exams taken yet")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.6))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 40)
                        } else {
                            VStack(spacing: 12) {
                                ForEach(settings.examHistory) { record in
                                    ExamHistoryRow(record: record) {
                                        selectedRecord = record
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
                .background(Color.blue)
            }
        }
        .navigationBarHidden(true)
        .confirmationDialog("Clear all exam history?", isPresented: $showClearConfirm, titleVisibility: .visible) {
            Button("Clear All", role: .destructive) { settings.clearAllHistory() }
            Button("Cancel", role: .cancel) { }
        }
        .sheet(item: $selectedRecord) { record in
            ExamDetailView(record: record)
        }
    }
}

// MARK: - Exam History Row
struct ExamHistoryRow: View {
    let record: ExamRecord
    let onTap: () -> Void

    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .short
        return f
    }()

    private var gradeColor: Color {
        switch record.percentage {
        case 90...100: return .green
        case 80..<90:  return .blue
        case 70..<80:  return .yellow
        case 60..<70:  return .orange
        default:       return .red
        }
    }

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                // Grade circle
                ZStack {
                    Circle()
                        .fill(gradeColor.opacity(0.15))
                        .frame(width: 52, height: 52)
                    Circle()
                        .stroke(gradeColor, lineWidth: 2.5)
                        .frame(width: 52, height: 52)
                    Text(record.gradeLetter)
                        .font(.system(size: 22, weight: .black))
                        .foregroundColor(gradeColor)
                }

                // Info
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(record.total)-Question Quiz")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.primary)
                    Text("\(record.score) / \(record.total) correct · \(Int(record.percentage))%")
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                    Text(Self.dateFormatter.string(from: record.date))
                        .font(.system(size: 12))
                        .foregroundColor(.secondary.opacity(0.8))
                }

                Spacer()

                // Missed badge
                if !record.missedQuestions.isEmpty {
                    VStack(spacing: 2) {
                        Text("\(record.missedQuestions.count)")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.red)
                        Text("missed")
                            .font(.system(size: 10))
                            .foregroundColor(.red.opacity(0.8))
                    }
                } else {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                        .font(.title3)
                }

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary.opacity(0.5))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemBackground))
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Exam Detail View (sheet)
struct ExamDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let record: ExamRecord

    @State private var expandedID: UUID? = nil

    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()

    private var gradeColor: Color {
        switch record.percentage {
        case 90...100: return .green
        case 80..<90:  return .blue
        case 70..<80:  return .yellow
        case 60..<70:  return .orange
        default:       return .red
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {

                    // ── Score summary ─────────────────────────────────────
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .stroke(Color.gray.opacity(0.15), lineWidth: 12)
                                .frame(width: 120, height: 120)
                            Circle()
                                .trim(from: 0, to: CGFloat(record.percentage / 100))
                                .stroke(gradeColor,
                                        style: StrokeStyle(lineWidth: 12, lineCap: .round))
                                .frame(width: 120, height: 120)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut(duration: 1.0), value: record.percentage)

                            VStack(spacing: 0) {
                                Text(record.gradeLetter)
                                    .font(.system(size: 42, weight: .black))
                                    .foregroundColor(gradeColor)
                                Text("\(Int(record.percentage))%")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.secondary)
                            }
                        }

                        Text("\(record.score) / \(record.total) Correct")
                            .font(.title2).fontWeight(.bold)

                        HStack(spacing: 6) {
                            Image(systemName: "calendar")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(Self.dateFormatter.string(from: record.date))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        HStack(spacing: 6) {
                            Image(systemName: record.cluster.iconName)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(record.cluster.rawValue)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top, 20)

                    // ── Missed questions ──────────────────────────────────
                    if record.missedQuestions.isEmpty {
                        VStack(spacing: 10) {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 44))
                                .foregroundColor(.green)
                            Text("Perfect Score!")
                                .font(.headline)
                                .foregroundColor(.green)
                            Text("You got every question right on this exam.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                        }
                        .padding(.vertical, 20)
                    } else {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.orange)
                                Text("Missed Questions (\(record.missedQuestions.count))")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding(.horizontal, 20)

                            VStack(spacing: 10) {
                                ForEach(record.missedQuestions) { q in
                                    MissedQuestionCard(question: q)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
                .padding(.bottom, 40)
            }
            .navigationTitle("\(record.total)-Question Exam")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

// MARK: - Settings Text Field (kept for potential future use)
struct SettingsTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 24)
            TextField(placeholder, text: $text)
                .foregroundColor(.primary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
        )
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(SettingsManager())
    }
}

