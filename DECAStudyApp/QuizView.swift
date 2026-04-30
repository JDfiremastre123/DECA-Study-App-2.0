//
//  QuizView.swift
//  DECA Study App
//

import SwiftUI

struct QuizView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: SettingsManager

    let cluster: ExamCluster
    let questionCount: Int

    // ── State ─────────────────────────────────────────────────────────────
    @State private var questions: [QuizQuestion] = []
    @State private var currentIndex: Int = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showExplanation = false
    @State private var score = 0
    @State private var showResults = false
    @State private var incorrectQuestions: [QuizQuestion] = []

    private var current: QuizQuestion? {
        guard currentIndex < questions.count else { return nil }
        return questions[currentIndex]
    }

    private var progress: Double {
        questions.isEmpty ? 0 : Double(currentIndex) / Double(questions.count)
    }

    // ── Body ──────────────────────────────────────────────────────────────
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            if showResults {
                QuizResultsView(
                    score: score,
                    total: questions.count,
                    incorrectQuestions: incorrectQuestions,
                    cluster: cluster,
                    onRetry: resetQuiz,
                    onExit: { dismiss() }
                )
            } else if let q = current {
                VStack(spacing: 0) {
                    // ── Header ─────────────────────────────────────────
                    ZStack {
                        HStack {
                            Button(action: { dismiss() }) {
                                Image(systemName: "arrowshape.backward.circle")
                                    .font(.title2).foregroundColor(.primary)
                            }
                            Spacer()
                            VStack(spacing: 2) {
                                Text(cluster.rawValue.uppercased())
                                    .font(.system(size: 15, weight: .heavy))
                                Text("\(currentIndex + 1) / \(questions.count)")
                                    .font(.caption).foregroundColor(.black)
                            }
                            Spacer()
                            Image(systemName: cluster.iconName)
                                .font(.title2).foregroundColor(.white)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                    }
                    .frame(height: 80).background(cluster.color)

                    // ── Progress bar ───────────────────────────────────
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: geo.size.width * CGFloat(progress))
                                .animation(.easeInOut(duration: 0.3), value: progress)
                        }
                    }
                    .frame(height: 4)

                    ScrollView {
                        VStack(spacing: 20) {
                            // ── Question ───────────────────────────────
                            Text(q.question)
                                .font(.system(size: CGFloat(settings.textSize) + 2,
                                              weight: .semibold))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                                .padding(.top, 28)

                            // ── Answer options ─────────────────────────
                            VStack(spacing: 12) {
                                ForEach(0..<q.options.count, id: \.self) { i in
                                    AnswerButton(
                                        label: optionLabel(i),
                                        text: q.options[i],
                                        state: buttonState(optionIndex: i,
                                                           correctIndex: q.correctIndex),
                                        fontSize: CGFloat(settings.textSize)
                                    ) {
                                        if selectedAnswer == nil {
                                            selectedAnswer = i
                                            if i == q.correctIndex {
                                                score += 1
                                            } else {
                                                incorrectQuestions.append(q)
                                            }
                                            withAnimation { showExplanation = true }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 20)

                            // ── Explanation ────────────────────────────
                            if showExplanation {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(systemName: selectedAnswer == q.correctIndex
                                              ? "checkmark.circle.fill"
                                              : "xmark.circle.fill")
                                        .foregroundColor(selectedAnswer == q.correctIndex
                                                         ? .green : .red)
                                        Text(selectedAnswer == q.correctIndex
                                             ? "Correct!" : "Incorrect")
                                        .fontWeight(.bold)
                                        .foregroundColor(selectedAnswer == q.correctIndex
                                                         ? .green : .red)
                                    }
                                    .font(.headline)

                                    Text(q.explanation)
                                        .font(.system(size: CGFloat(settings.textSize) - 1))
                                        .foregroundColor(.primary)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(Color(.secondarySystemBackground))
                                )
                                .padding(.horizontal, 20)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                            }

                            Spacer(minLength: 20)
                        }
                    }

                    // ── Next / Finish button ───────────────────────────
                    if showExplanation {
                        Button(action: nextQuestion) {
                            Text(currentIndex + 1 < questions.count
                                 ? "Next Question"
                                 : "See Results")
                            .font(.headline).fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(cluster.color)
                            .cornerRadius(14)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                        .transition(.opacity)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: loadQuestions)
    }

    // ── Helpers ───────────────────────────────────────────────────────────
    private func loadQuestions() {
        let pool = MarketingDatabase.quizQuestions
            .filter { $0.cluster == cluster }
            .shuffled()
        questions = Array(pool.prefix(questionCount))
    }

    private func nextQuestion() {
        selectedAnswer = nil
        showExplanation = false
        if currentIndex + 1 < questions.count {
            currentIndex += 1
        } else {
            showResults = true
        }
    }

    private func resetQuiz() {
        score = 0
        currentIndex = 0
        selectedAnswer = nil
        showExplanation = false
        showResults = false
        incorrectQuestions = []
        loadQuestions()
    }

    private func optionLabel(_ index: Int) -> String {
        ["A", "B", "C", "D"][index]
    }

    private func buttonState(optionIndex: Int, correctIndex: Int) -> AnswerState {
        guard let selected = selectedAnswer else { return .neutral }
        if optionIndex == correctIndex { return .correct }
        if optionIndex == selected { return .wrong }
        return .neutral
    }
}

// MARK: - Answer State
enum AnswerState { case neutral, correct, wrong }

// MARK: - Answer Button
struct AnswerButton: View {
    let label: String
    let text: String
    let state: AnswerState
    let fontSize: CGFloat
    let action: () -> Void

    var bg: Color {
        switch state {
        case .neutral: return Color(.secondarySystemBackground)
        case .correct: return Color.green.opacity(0.18)
        case .wrong:   return Color.red.opacity(0.15)
        }
    }
    var border: Color {
        switch state {
        case .neutral: return .clear
        case .correct: return .green
        case .wrong:   return .red
        }
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(state == .neutral ? Color.blue.opacity(0.12) : border.opacity(0.2))
                        .frame(width: 36, height: 36)
                    Text(label)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(state == .neutral ? .blue : border)
                }
                Text(text)
                    .font(.system(size: fontSize - 1))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                if state == .correct {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                } else if state == .wrong {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.red)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(bg)
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(border, lineWidth: 2))
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        QuizView(cluster: .marketing, questionCount: 10)
            .environmentObject(SettingsManager())
    }
}
