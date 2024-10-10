//
//  QuestionContent.swift
//  TriviaGame
//
//  Created by Diana Lim on 10/9/24.
//

import Foundation
import SwiftUI

struct QuestionContent: View {
    @EnvironmentObject var viewModel: QuizViewModel
    let question: Question
    @State private var shakeOffset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: question.symbolName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .foregroundColor(.blue)
            
            Text(question.text)
                .font(.title2)
                .multilineTextAlignment(.center)
            
            ForEach(question.answers, id: \.self) { answer in
                AnswerButton(answer: answer, isSelected: .constant(false)) {
                    viewModel.submitAnswer(answer)
                    if !viewModel.isCorrect {
                        withAnimation(.default.repeatCount(3).speed(4)) {
                            shakeOffset = 10
                        }
                    }
                }
            }
            .offset(x: shakeOffset)
            .animation(.default.repeatCount(3).speed(4), value: shakeOffset)
            
            if viewModel.showFeedback {
                FeedbackView(isCorrect: viewModel.isCorrect, correctAnswer: question.correctAnswer)
                
                Button("Next Question") {
                    if viewModel.currentQuestionIndex == viewModel.questions.count - 1 {
                        viewModel.quizFinished = true
                    } else {
                        viewModel.nextQuestion()
                    }
                    shakeOffset = 0
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}
