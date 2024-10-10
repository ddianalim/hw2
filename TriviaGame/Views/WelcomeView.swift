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
        NavigationStack {
            VStack(spacing: 20) {
                Text("UPenn Trivia")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Test your knowledge about the University of Pennsylvania!")
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(destination: QuestionView().environmentObject(viewModel)) {
                    Text("Start Quiz")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
