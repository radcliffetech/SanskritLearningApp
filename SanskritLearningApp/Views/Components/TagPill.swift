//
//  TagPill.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI
    

struct TagPill: View {
    let tag: String
    
    var body: some View {
        Text(tag)
            .font(.system(size: 10))
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background(Color.blue.opacity(0.2))
            .foregroundColor(.blue)
            .clipShape(Capsule())

}

}

#Preview {
    TagPill(tag: "Hello")
}
