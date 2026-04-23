//
//  TitleScreen.swift
//  DECA Study App
//

import SwiftUI

struct TitleScreen: View {
    @State private var showExamPicker = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.ignoresSafeArea()

                VStack(spacing: 30) {
                    Spacer()

                    
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 200, height: 200)
                        Image("DECA_Logo")
                                 .resizable()
                                 .scaledToFit()
                                 .frame(width: 150, height: 150)
                                 .cornerRadius(50)
                    }
                    .shadow(radius: 10)

                    Spacer()

                    Text("DECA Study App")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)

                    Button(action: { showExamPicker = true }) {
                        Text("START")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .frame(width: 330, height: 80)
                            .background(Color.white)
                            .cornerRadius(30)
                    }

                    Spacer()
                }
                .navigationBarHidden(true)
                .sheet(isPresented: $showExamPicker) {
                    ExamSelectionView(/* TODO: Pass in a function that runs in the TitleScreen to dismiss the sheet and then mount the next view with the selected cluster */)
                }
            }
        }
    }
}

#Preview {
    TitleScreen().environmentObject(SettingsManager())
}
