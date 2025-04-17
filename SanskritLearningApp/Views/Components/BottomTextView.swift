//
//  BottomTextView.swift
//  Code History
//
//  Created by Jeffrey Radcliffe on 3/24/25.
//
import SwiftUI

struct BottomTextView: View {
    let str: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(str)
                .font(.body)
                .bold()
                .padding()
                .foregroundColor(.white)
            Spacer()
        }.background(AppColor.accent)
    }
}

#Preview {
    BottomTextView(str: "Here is some text")
}
