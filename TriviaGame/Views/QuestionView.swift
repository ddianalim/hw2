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
    @State private var opacity = 0.0
    @State private var offset: CGSize = .zero

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.questions.count)")
                    .font(.headline)
                Spacer()
                Text("Score: \(viewModel.score)")
                    .font(.headline)
                    .foregroundColor(.green)
            }
            .padding(.horizontal)
            
            if viewModel.currentQuestionIndex < viewModel.questions.count {
                QuestionContent(question: viewModel.questions[viewModel.currentQuestionIndex])
                    .opacity(opacity)
                    .offset(offset)
                    .animation(.easeInOut, value: viewModel.currentQuestionIndex)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.5)) {
                            opacity = 1.0
                        }
                    }
            }
        }
        .padding()
        .navigationBarTitle("UPenn Quiz", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .onChange(of: viewModel.showFeedback) { _, newValue in
            if !newValue {
                // Reset opacity for fade-in effect on new question
                opacity = 0.0
                withAnimation(.easeIn(duration: 0.5)) {
                    opacity = 1.0
                }
            }
        }
    }
}
