//
//  ScoreView.swift
//  Code History
//
//  Created by Jeffrey Radcliffe on 3/25/25.
//

import SwiftUI

struct ScoreView: View {
    let quizViewModel: ScoreViewModel
    @ObservedObject var viewModel: QuizViewModel
    @State private var playAgain = false

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Spacer()
                
                Text("Quiz Over")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 32) {
                    Text("\(quizViewModel.correctGuesses) ✅")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    Text("\(quizViewModel.incorrectGuesses) ❌")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                }
                
                Text("Final Score: \(quizViewModel.percentage)%")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)

                Divider()
                    .padding(.horizontal)
                VStack(spacing: 16) {
                    Button(action: {
                        viewModel.endQuiz()
                    }) {
                        BottomTextView(str: "Home")
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .environmentObject(viewModel)
        }
        .navigationBarBackButtonHidden(true)
    }
    

}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(quizViewModel: ScoreViewModel(
            correctGuesses: 8, incorrectGuesses: 2
        ),
      viewModel: QuizViewModel()
        )
    }
}
