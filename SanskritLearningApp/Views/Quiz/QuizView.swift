//
//  QuizView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/15/25.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var showingScore: Bool = false

    var body: some View {
        ZStack {
            ZStack {
                VStack(spacing: 8) {
                    HStack {
                        Text("Mode: \(viewModel.selectedMode == .basic ? "Easy" : "Hard")")
                            .font(.caption)
                            .foregroundColor(.secondary)
 
                        Spacer()
                        Spacer()
 
                        Text(viewModel.questionProgressText)
                            .font(.caption)
                            .foregroundColor(.secondary)
 
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    QuestionView(question: viewModel.currentQuestion)

                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.endQuiz()
                        }) {
                            Image(systemName: "arrow.right.square")
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                        .padding(.trailing)
                    }
                    .padding(.bottom, 8)
                }
            }
            .navigationBarHidden(true)
            .environmentObject(viewModel)
        }
        .onChange(of: viewModel.quizIsOver) { _, newValue in
            if newValue {
                showingScore = true
            }
        }
        .navigationDestination(isPresented: $showingScore) {
            ScoreView(
                quizViewModel: ScoreViewModel(
                    correctGuesses: viewModel.correctGuesses,
                    incorrectGuesses: viewModel.incorrectGuesses
                ),
                viewModel: viewModel
            )
        }
    }
}


#Preview {
    QuizView(viewModel: QuizViewModel())
}
