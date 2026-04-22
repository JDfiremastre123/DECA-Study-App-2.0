//
//  MenuPageView.swift
//  DECA Study App
//

import SwiftUI

struct MenuPageView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: SettingsManager

    let cluster: ExamCluster

    @State private var showStudyMode    = false
    @State private var showQuizMode     = false
    @State private var showSettings     = false

    var displayName: String {
        settings.playerName.isEmpty ? "Player" : settings.playerName
    }

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            VStack(spacing: 0) {
                // ── Header ───────────────────────────────────────────────
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "arrowshape.backward.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text("Welcome, \(displayName)!")
                            .font(.title3).fontWeight(.bold)
                            .foregroundColor(.blue)
                        Text(cluster.rawValue)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
                .padding(.bottom, 20)

                Spacer()

                // ── Mode Buttons ─────────────────────────────────────────
                VStack(spacing: 22) {
                    ModeButton(
                        title: "Study Mode",
                        subtitle: "Browse terms & definitions",
                        icon: "book.pages.fill",
                        color: .blue,
                        isAvailable: true
                    ) {
                        showStudyMode = true
                    }

                    ModeButton(
                        title: "Quiz Mode",
                        subtitle: "Test yourself — 10 to 100 questions",
                        icon: "checklist",
                        color: .blue,
                        isAvailable: true
                    ) {
                        showQuizMode = true
                    }

                    ModeButton(
                        title: "Game Mode",
                        subtitle: "Coming soon",
                        icon: "gamecontroller.fill",
                        color: .gray,
                        isAvailable: false
                    ) { }
                }
                .padding(.horizontal, 24)

                Spacer()

                // Decorative wave
                GeometryReader { geo in
                    Path { p in
                        p.move(to: CGPoint(x: 0, y: 60))
                        p.addCurve(
                            to: CGPoint(x: geo.size.width, y: 20),
                            control1: CGPoint(x: geo.size.width * 0.35, y: -20),
                            control2: CGPoint(x: geo.size.width * 0.65, y: 60)
                        )
                        p.addLine(to: CGPoint(x: geo.size.width, y: 80))
                        p.addLine(to: CGPoint(x: 0, y: 80))
                    }
                    .fill(Color.blue.opacity(0.15))
                }
                .frame(height: 80)
            }
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $showStudyMode) {
            StudyModeView(cluster: cluster)
        }
        .navigationDestination(isPresented: $showQuizMode) {
            QuizSetupView(cluster: cluster)
        }
        .navigationDestination(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

// MARK: - Mode Button
struct ModeButton: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let isAvailable: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.25))
                        .frame(width: 52, height: 52)
                    Image(systemName: icon)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(.white)
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.85))
                }
                Spacer()
                if isAvailable {
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isAvailable ? color : Color.gray.opacity(0.45))
            )
            .shadow(color: isAvailable ? color.opacity(0.35) : .clear, radius: 8, x: 0, y: 4)
        }
        .disabled(!isAvailable)
    }
}

#Preview {
    NavigationStack {
        MenuPageView(cluster: .marketing)
            .environmentObject(SettingsManager())
    }
}
