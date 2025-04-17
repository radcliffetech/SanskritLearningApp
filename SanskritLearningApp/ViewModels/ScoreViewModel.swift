//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Jeffrey Radcliffe on 3/25/25.
//
import Foundation

class ScoreViewModel: ObservableObject {
    var correctGuesses: Int
    var incorrectGuesses: Int
    var percentage: Int {
      (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
    
    init(correctGuesses: Int, incorrectGuesses: Int) {
        self.correctGuesses = correctGuesses
        self.incorrectGuesses = incorrectGuesses
    }
}


