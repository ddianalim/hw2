//
//  QuestionView.swift
//  TriviaGame
//
//  Created by Diana Lim on 9/28/24.
//

import Foundation
import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: QuizViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.questions.count)")
                .font(.headline)
            
            Image(viewModel.questions[viewModel.currentQuestionIndex].imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text(viewModel.questions[viewModel.currentQuestionIndex].text)
                .font(.title2)
                .multilineTextAlignment(.center)
            
            ForEach(viewModel.questions[viewModel.currentQuestionIndex].answers, id: \.self) { answer in
                Button(action: {
                    viewModel.submitAnswer(answer)
                }) {
                    Text(answer)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .navigationBarTitle("UPenn Quiz", displayMode: .inline)
        .navigationDestination(isPresented: $viewModel.quizFinished) {
            ScoreView()
        }
    }
}
