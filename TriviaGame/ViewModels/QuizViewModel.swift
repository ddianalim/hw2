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
    @Published var selectedAnswer: String?
    @Published var score: Int = 0
    @Published var quizFinished: Bool = false
    
    init() {
        loadQuestions()
    }
    
    func loadQuestions() {
        questions = [
            Question(text: "In what year was the University of Pennsylvania founded?",
                     imageName: "penn_founding",
                     answers: ["1740", "1751", "1776", "1800"],
                     correctAnswer: "1740"),
            Question(text: "Who founded the University of Pennsylvania?",
                     imageName: "penn_founder",
                     answers: ["Benjamin Franklin", "William Penn", "Thomas Jefferson", "George Washington"],
                     correctAnswer: "Benjamin Franklin"),
            Question(text: "What is UPenn's official mascot?",
                     imageName: "penn_mascot",
                     answers: ["The Quaker", "The Nittany Lion", "The Eagle", "The Bulldog"],
                     correctAnswer: "The Quaker"),
            Question(text: "Which school at UPenn is the oldest business school in the world?",
                     imageName: "wharton_logo",
                     answers: ["Wharton School", "College of Arts and Sciences", "School of Engineering", "Annenberg School"],
                     correctAnswer: "Wharton School"),
            Question(text: "What color(s) represent UPenn?",
                     imageName: "penn_colors",
                     answers: ["Red and Blue", "Blue and White", "Green and Gold", "Purple and White"],
                     correctAnswer: "Red and Blue"),
            Question(text: "Which US President was a professor at UPenn's Law School?",
                     imageName: "penn_law",
                     answers: ["William Howard Taft", "Woodrow Wilson", "Theodore Roosevelt", "Grover Cleveland"],
                     correctAnswer: "William Howard Taft"),
            Question(text: "What is the name of UPenn's student newspaper?",
                     imageName: "penn_newspaper",
                     answers: ["The Daily Pennsylvanian", "The Penn Post", "The Quaker Times", "The Franklin Gazette"],
                     correctAnswer: "The Daily Pennsylvanian")
        ]
    }
    
    func submitAnswer(_ answer: String) {
        selectedAnswer = answer
        if answer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            quizFinished = true
        }
    }
    
    func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        quizFinished = false
        loadQuestions()
    }
}
