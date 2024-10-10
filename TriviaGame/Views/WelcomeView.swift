//
//  WelcomeView.swift
//  TriviaGame
//
//  Created by Diana Lim on 9/28/24.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: QuizViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("UPenn Trivia")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Test your knowledge about the University of Pennsylvania!")
                .multilineTextAlignment(.center)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Instructions:")
                    .font(.headline)
                Text("• Answer 5 questions about UPenn")
                Text("• Each correct answer earns you a point")
                Text("• Try to get the highest score possible!")
                Text("• Have fun and learn something new!")
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            Button("Start Quiz") {
                viewModel.quizStarted = true
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

