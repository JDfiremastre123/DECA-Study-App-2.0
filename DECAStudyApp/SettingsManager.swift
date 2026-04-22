//
//  SettingsManager.swift
//  DECA Study App
//

import SwiftUI

class SettingsManager: ObservableObject {
    @AppStorage("playerName")     var playerName: String     = ""
    @AppStorage("dateOfBirth")    var dateOfBirth: String    = ""
    @AppStorage("school")         var school: String         = ""
    @AppStorage("event")          var event: String          = ""
    @AppStorage("grade")          var grade: String          = ""
    @AppStorage("textSize")       var textSize: Double       = 16.0
    @AppStorage("darkMode")       var darkMode: Bool         = false
}
