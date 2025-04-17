//
//  AboutView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/16/25.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Sanskrit")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            Image("om") // Replace with actual asset name if available
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            Text("Test your vocabulary and improve your Sanskrit skills with fun and interactive quizzes. Learn about the alphabet, grammar, and more!")
                .multilineTextAlignment(.center)
                .padding()
            Text("Developed respectfully by Jeffrey Radcliffe.")
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Close") {
                dismiss()
            }
            .font(.headline)
            .padding(.bottom)
        }
    }
}

#Preview {
    AboutView()
}
