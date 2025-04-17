//
//  QuizViewModel.swift
//  Code History
//
//  Created by Jeffrey Radcliffe on 3/25/25.
//

import SwiftUI

class QuizViewModel: ObservableObject {
    
    @Published var quiz = Quiz()
    @Published var selectedMode: QuizMode = .medium
    @Published var questionCount: Int = 5

    var quizIsOver: Bool {
        quiz.isOver
    }
    
    var quizIsDismissed: Bool {
        quiz.isDismissed
    }
    
    var currentQuestion: Question {
        quiz.currentQuestion
    }
    
    var questionProgressText: String {
      "\(quiz.currentQuestionIndex + 1) / \(quiz.numberOfQuestions)"
    }

    var guessWasMade: Bool {
        if let _ = quiz.guesses[currentQuestion.id] {
            return true
        } else {
            return false
        }
    }
    
    func makeGuess(atIndex: Int) {
        _ = quiz.makeGuessForCurrentQuestion(atIndex: atIndex)
    }
    
    func displayNextScreen() {
        quiz.updateQuizStatus()
    }
    
    func endQuiz() {
        quiz.dismiss()
    }
    
    func style(forOptionIndex optionIndex: Int) -> ChoiceButtonStyle {
        let optionAnswer = currentQuestion.possibleAnswers[optionIndex]
        let correctAnswer = currentQuestion.answer

        if let guessedIndex = quiz.guesses[currentQuestion.id] {
            let guessedAnswer = currentQuestion.possibleAnswers[guessedIndex]

            if optionAnswer == correctAnswer {
                if guessedAnswer == optionAnswer {
                    return .correct
                } else {
                    return .missed
                }
            } else {
                if guessedIndex == optionIndex {
                    return .incorrect
                } else {
                    return .disabled
                }
            }
        } else {
            return .normal
        }
    }
    
    var correctGuesses: Int {
        quiz.correct
    }
      
    var incorrectGuesses: Int {
        quiz.incorrect
    }
    
    func resetQuiz(mode: QuizMode? = nil, count: Int? = nil) {
        let modeToUse = mode ?? selectedMode
        let countToUse = count ?? questionCount
        self.quiz = Quiz(mode: modeToUse, questionCount: countToUse)
    }
}
