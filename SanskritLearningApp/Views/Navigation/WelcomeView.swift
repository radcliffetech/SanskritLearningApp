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

            Image("om")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .opacity(0.4)
                .padding()

            Text("भूर्भुवः स्वः तत्सवितुर्वरेण्यं भर्गो देवस्य")
                .font(.headline)
            Text("धीमहि धियो यो नः प्रचोदयात्॥")
                .font(.headline)
            Spacer()
        }
    }
}

#Preview {
    WelcomeView()
}
