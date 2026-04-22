//
//  SettingsView.swift
//  DECA Study App
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: SettingsManager

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
                .padding(.top, 60)
                .padding(.bottom, 24)

                // ── Form ─────────────────────────────────────────────────
                ScrollView {
                    VStack(spacing: 14) {
                        SettingsTextField(icon: "person.fill",
                                          placeholder: "Name",
                                          text: $settings.playerName)
                        SettingsTextField(icon: "calendar",
                                          placeholder: "Date of Birth (MM/DD/YYYY)",
                                          text: $settings.dateOfBirth)
                        SettingsTextField(icon: "building.columns.fill",
                                          placeholder: "School / Chapter",
                                          text: $settings.school)
                        SettingsTextField(icon: "trophy.fill",
                                          placeholder: "DECA Event",
                                          text: $settings.event)
                        SettingsTextField(icon: "graduationcap.fill",
                                          placeholder: "Grade",
                                          text: $settings.grade)

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

                        // Security icon row (decorative, to match mockup)
                        HStack {
                            Spacer()
                            Image(systemName: "lock.shield.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white.opacity(0.25))
                            Spacer()
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
                .background(Color.blue)
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Settings Text Field
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
