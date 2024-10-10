//
//  ContentView.swift
//  TriviaGame
//
//  Created by Diana Lim on 9/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuizViewModel()
    
    var body: some View {
        NavigationStack {
            WelcomeView()
                .navigationDestination(isPresented: $viewModel.quizStarted) {
                    QuestionView()
                }
                .navigationDestination(isPresented: $viewModel.quizFinished) {
                    ScoreView()
                }
        }
        .environmentObject(viewModel)
    }
}
#Preview {
    ContentView()
}
