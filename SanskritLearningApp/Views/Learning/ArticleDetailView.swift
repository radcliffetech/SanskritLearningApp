//
//  ArticleDetailView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI
import MarkdownUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)

                Divider()

                Markdown(article.content)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArticleDetailView(article: Article(
        id: .init(),
        title: "Test",
        author: "Test Author",
        summary: "Test",
        content: "Test",
        keywords: ["foo", "bar", "baz"],
    ))
}
