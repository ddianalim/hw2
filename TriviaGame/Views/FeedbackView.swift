//
//  FeedbackView.swift
//  TriviaGame
//
//  Created by Diana Lim on 10/9/24.
//

import Foundation
import SwiftUI

struct FeedbackView: View {
    let isCorrect: Bool
    let correctAnswer: String
    
    var body: some View {
        VStack {
            Text(isCorrect ? "Correct!" : "Incorrect")
                .font(.title)
                .foregroundColor(isCorrect ? .green : .red)
            
            if !isCorrect {
                Text("The correct answer is: \(correctAnswer)")
                    .font(.subheadline)
            }
        }
    }
}
