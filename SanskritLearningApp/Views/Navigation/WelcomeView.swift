//
//  WelcomeView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image("sri-yantra")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .opacity(0.4)
                .padding()


            Spacer()
        }
    }
}

#Preview {
    WelcomeView()
}
