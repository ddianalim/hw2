//
//  AnswerView.swift
//  TriviaGame
//
//  Created by Diana Lim on 10/9/24.
//

import Foundation
import SwiftUI

struct AnswerButton: View {
    let answer: String
    @Binding var isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            isSelected = true
            action()
        }) {
            Text(answer)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.green : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .disabled(isSelected)
    }
}
