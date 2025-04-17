//  GrammarWelcomeView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI


struct ArticlesListView: View {
    @State private var articles: [Article] = []

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                List(articles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(article.title)
                                .font(.headline)
                            HStack {
                                ForEach(article.tags, id: \.self) { tag in
                                    TagPill(tag: tag)
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .onAppear {
                articles = JSONLoader.load(from: "articles", as: [Article].self)
            }
        }
    }
}


#Preview {
    ArticlesListView()
}
