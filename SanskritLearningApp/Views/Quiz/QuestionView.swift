//
//  QuestionView.swift
//  Code History
//
//  Created by Jeffrey Radcliffe on 3/25/25.
//

import SwiftUI



struct QuestionView: View {
    
    @EnvironmentObject var viewModel: QuizViewModel
    let question: Question
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text(question.prompt)
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.leading)
                VStack(spacing: 16) {
                    ForEach(Array(question.possibleAnswers.enumerated()), id: \.element) { answerIndex, answer in
                        ChoiceButton(answer: answer, style: viewModel.style(forOptionIndex: answerIndex)) {
                            print("Tapped on option with the text: \(answer)")
                            viewModel.makeGuess(atIndex: answerIndex)
                        }
                    }
                }
                if viewModel.guessWasMade {
                    Button(action: { viewModel.displayNextScreen() }) {
                        BottomTextView(str: "Next")
                    }
                }
            }
            .padding()
        }
    
    }
     
}



#Preview {
    QuestionView(question: Quiz().currentQuestion).environmentObject(QuizViewModel())
}
