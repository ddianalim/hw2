//
//  QuizViewModel.swift
//  TriviaGame
//
//  Created by Diana Lim on 9/28/24.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var quizStarted: Bool = false
    @Published var quizFinished: Bool = false
    @Published var showFeedback: Bool = false
    @Published var isCorrect: Bool = false
    
    init() {
        loadQuestions()
    }
    
    func loadQuestions() {
            questions = [
                Question(text: "In what year was the University of Pennsylvania founded?",
                         symbolName: "building.columns.fill",
                         answers: ["1700", "1740", "1751", "1776"],
                         correctAnswer: "1740"),
                Question(text: "Who founded the University of Pennsylvania?",
                         symbolName: "person.fill",
                         answers: ["William Penn", "Thomas Jefferson", "Benjamin Franklin", "George Washington"],
                         correctAnswer: "Benjamin Franklin"),
                Question(text: "What is UPenn's official mascot?",
                         symbolName: "figure.wave",
                         answers: ["The Nittany Lion", "The Eagle", "The Bulldog", "The Quaker"],
                         correctAnswer: "The Quaker"),
                Question(text: "Which school at UPenn is the oldest business school in the world?",
                         symbolName: "building.2.fill",
                         answers: ["Annenberg School", "Wharton School", "College of Arts and Sciences", "School of Engineering"],
                         correctAnswer: "Wharton School"),
                Question(text: "What color(s) represent UPenn?",
                         symbolName: "paintpalette.fill",
                         answers: ["Blue and White", "Green and Gold", "Red and Blue", "Purple and White"],
                         correctAnswer: "Red and Blue")
            ]
        }
    
    func submitAnswer(_ answer: String) {
        isCorrect = answer == questions[currentQuestionIndex].correctAnswer
        if isCorrect {
            score += 1
        }
        showFeedback = true
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            showFeedback = false
        } else {
            quizFinished = true
        }
    }
    
    func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
        quizStarted = false
        quizFinished = false
        showFeedback = false
        loadQuestions()
    }
}
