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
            Group {
                if viewModel.quizFinished {
                    ScoreView()
                } else if viewModel.quizStarted {
                    QuestionView()
                } else {
                    WelcomeView()
                }
            }
        }
        .environmentObject(viewModel)
    }
}
#Preview {
    ContentView()
}
