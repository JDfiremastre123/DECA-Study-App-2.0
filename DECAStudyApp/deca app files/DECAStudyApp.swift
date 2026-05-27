//
//  DECAStudyAppApp.swift
//  DECA Study App
//

import SwiftUI

@main

struct DECAStudyApp: App {
    @StateObject private var settingsManager = SettingsManager()
    var body: some Scene {
        WindowGroup {
            TitleScreen()
                .environmentObject(settingsManager)
                .preferredColorScheme(settingsManager.darkMode ? .dark : .light)
        }
    }
}
