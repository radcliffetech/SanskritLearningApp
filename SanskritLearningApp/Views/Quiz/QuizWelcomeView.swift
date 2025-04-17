//
//  WelcomeView.swift
//  Code History
//
//  Created by Jeffrey Radcliffe on 3/24/25.
//

import SwiftUI

struct QuizWelcomeView: View {
    @ObservedObject var viewModel = QuizViewModel()
    

    @State private var showingQuiz = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Image("om") // Replace with actual asset name if available
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
                Text("Test your Sanskrit knowledge.")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Difficulty")
                        .font(.headline)
                    
                    Picker("Mode", selection: $viewModel.selectedMode) {
                        Text("Easy").tag(QuizMode.basic)
                        Text("Medium").tag(QuizMode.medium)
                        Text("Hard").tag(QuizMode.advanced)
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Number of Questions: \(viewModel.questionCount)")
                        .font(.headline)
                    
                    Stepper(value: $viewModel.questionCount, in: 5...25) {
                        Text("Question Count")
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                        .shadow(radius: 4)
                )
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    viewModel.resetQuiz(mode: viewModel.selectedMode, count: viewModel.questionCount)
                    showingQuiz = true
                }) {
                    BottomTextView(str: "Start")
                }
                
                Spacer()
                
            }
            .environmentObject(viewModel)
            .padding()
            .onChange(of: viewModel.quizIsDismissed) { _, newValue in
                print("Change detected - Quiz dismissed: \(newValue)")
                if newValue {
                    withAnimation {
                        showingQuiz = false
                    }
                }
            }
            .navigationDestination(isPresented: $showingQuiz) {
                QuizView(viewModel: viewModel)
            }

        }
    }
}

#Preview {
    QuizWelcomeView()
}
