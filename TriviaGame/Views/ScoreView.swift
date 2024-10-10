//
//  ScoreView.swift
//  TriviaGame
//
//  Created by Diana Lim on 9/28/24.
//

import Foundation
import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Quiz Completed!")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Your score: \(viewModel.score) out of \(viewModel.questions.count)")
                .font(.title2)
            
            Button("Restart Quiz") {
                viewModel.resetQuiz()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            NavigationLink("Back to Welcome", destination: WelcomeView())
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
