//
//  QuizResultsView.swift
//  DECA Study App
//

import SwiftUI

struct QuizResultsView: View {
    let score: Int
    let total: Int
    let incorrectQuestions: [QuizQuestion]
    let cluster: ExamCluster
    let onRetry: () -> Void
    let onExit: () -> Void

    @State private var showMissed = false

    private var percentage: Double { Double(score) / Double(total) * 100 }

    private var grade: (letter: String, color: Color) {
        switch percentage {
        case 90...100: return ("A", .green)
        case 80..<90:  return ("B", .blue)
        case 70..<80:  return ("C", .yellow)
        case 60..<70:  return ("D", .orange)
        default:       return ("F", .red)
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                // ── Score card ────────────────────────────────────────────
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 14)
                            .frame(width: 140, height: 140)
                        Circle()
                            .trim(from: 0, to: CGFloat(percentage / 100))
                            .stroke(grade.color, style: StrokeStyle(lineWidth: 14, lineCap: .round))
                            .frame(width: 140, height: 140)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut(duration: 1.2), value: percentage)

                        VStack(spacing: 0) {
                            Text(grade.letter)
                                .font(.system(size: 48, weight: .black))
                                .foregroundColor(grade.color)
                            Text("\(Int(percentage))%")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.secondary)
                        }
                    }

                    Text("\(score) / \(total) Correct")
                        .font(.title2).fontWeight(.bold)

                    Text(scoreMessage)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                .padding(.top, 40)

                // ── Review missed questions ───────────────────────────────
                if !incorrectQuestions.isEmpty {
                    VStack(spacing: 0) {
                        Button(action: { withAnimation { showMissed.toggle() } }) {
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.orange)
                                Text("Review \(incorrectQuestions.count) Missed Question\(incorrectQuestions.count == 1 ? "" : "s")")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: showMissed ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.secondary)
                            }
                            .padding(16)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(14)
                        }

                        if showMissed {
                            VStack(spacing: 14) {
                                ForEach(incorrectQuestions) { q in
                                    MissedQuestionCard(question: q)
                                }
                            }
                            .padding(.top, 12)
                        }
                    }
                    .padding(.horizontal, 20)
                }

                // ── Action buttons ────────────────────────────────────────
                VStack(spacing: 12) {
                    Button(action: onRetry) {
                        Label("Try Again", systemImage: "arrow.clockwise")
                            .font(.headline).fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.blue)
                            .cornerRadius(14)
                    }

                    Button(action: onExit) {
                        Label("Back to Menu", systemImage: "house.fill")
                            .font(.headline).fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(14)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
    }

    private var scoreMessage: String {
        switch percentage {
        case 90...100: return "Outstanding! You're ready to ace the DECA exam! 🏆"
        case 80..<90:  return "Great work! A little more review and you'll be perfect."
        case 70..<80:  return "Good effort! Focus on the missed questions to improve."
        case 60..<70:  return "Keep practicing! Review the Study Mode terms."
        default:       return "Don't give up! Study Mode will help you master these concepts."
        }
    }
}

// MARK: - Missed Question Card
struct MissedQuestionCard: View {
    let question: QuizQuestion
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: { withAnimation { expanded.toggle() } }) {
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                        .padding(.top, 1)
                    Text(question.question)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
                .padding(14)
            }

            if expanded {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Correct Answer:")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.secondary)
                        .textCase(.uppercase)
                    Text(question.options[question.correctIndex])
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.green)

                    Text("Explanation:")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.secondary)
                        .textCase(.uppercase)
                    Text(question.explanation)
                        .font(.system(size: 13))
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
                .background(Color.green.opacity(0.05))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

#Preview {
    QuizResultsView(
        score: 8,
        total: 10,
        incorrectQuestions: [],
        cluster: .marketing,
        onRetry: {},
        onExit: {}
    )
}
