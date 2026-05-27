//
//  DECAStudyApp.swift
//  DECA Study App
//

import SwiftUI
import FirebaseCore

@main
struct DECAStudyApp: App {
    @StateObject private var settingsManager = SettingsManager()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            TitleScreen()
                .environmentObject(settingsManager)
                .preferredColorScheme(settingsManager.darkMode ? .dark : .light)
        }
    }
}

