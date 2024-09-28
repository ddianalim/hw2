//
//  Question.swift
//  TriviaGame
//
//  Created by Diana Lim on 9/28/24.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let imageName: String
    let answers: [String]
    let correctAnswer: String
}
