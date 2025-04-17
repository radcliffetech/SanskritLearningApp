//
//  ArticleDetailView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)

                HStack {
                    ForEach(article.tags, id: \.self) { tag in
                        TagPill(tag: tag)
                    }
                }

                Divider()

                Text(article.content)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArticleDetailView(article: Article(id: .init(), title: "Test", tags: ["foo", "bar", "baz"], content: "Test"))
}
