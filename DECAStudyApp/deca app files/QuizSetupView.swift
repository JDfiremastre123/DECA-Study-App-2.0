//
//  QuizSetupView.swift
//  DECA Study App
//

import SwiftUI

struct QuizSetupView: View {
    @Environment(\.dismiss) private var dismiss
    let cluster: ExamCluster

    @State private var selectedLength: QuizLength = .ten
    @State private var startQuiz = false

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            VStack(spacing: 0) {
                // ── Header ───────────────────────────────────────────────
                ZStack {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "arrowshape.backward.circle")
                                .font(.title2).foregroundColor(.primary)
                        }
                        Spacer()
                        VStack(spacing: 2) {
                            Text(cluster.rawValue.uppercased())
                                .font(.system(size: 16, weight: .heavy))
                            Text("Quiz Mode")
                                .font(.caption).foregroundColor(.black)
                        }
                        Spacer()
                        Image(systemName: "checklist")
                            .font(.title2).foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                }
                .frame(height: 80).background(cluster.color)

                Spacer()

                // ── Quiz length selection ─────────────────────────────────
                VStack(spacing: 16) {
                    Text("How many questions?")
                        .font(.title3).fontWeight(.bold)

                    ForEach(QuizLength.allCases, id: \.self) { length in
                        let available = length.rawValue <= MarketingDatabase.quizQuestions
                            .filter { $0.cluster == cluster }.count

                        Button(action: {
                            if available { selectedLength = length }
                        }) {
                            HStack {
                                Text(length.label)
                                    .font(.headline)
                                    .foregroundColor(available
                                        ? (selectedLength == length ? .white : .primary)
                                        : .gray)
                                Spacer()
                                if !available {
                                    Text("Not enough questions yet")
                                        .font(.caption)
                                        .foregroundColor(.orange)
                                }
                                if selectedLength == length && available {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(selectedLength == length && available
                                          ? cluster.color
                                          : Color(.secondarySystemBackground))
                            )
                        }
                        .disabled(!available)
                    }
                }
                .padding(.horizontal, 24)

                Spacer()

                // ── Start button ─────────────────────────────────────────
                Button(action: { startQuiz = true }) {
                    Text("Start Quiz")
                        .font(.title3).fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(cluster.color)
                        .cornerRadius(16)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $startQuiz) {
            QuizView(cluster: cluster, questionCount: selectedLength.rawValue)
        }
    }
}

#Preview {
    NavigationStack {
        QuizSetupView(cluster: .marketing)
            .environmentObject(SettingsManager())
    }
}
