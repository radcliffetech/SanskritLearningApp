//  GrammarWelcomeView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI


struct ArticlesListView: View {
    
    @State private var articles: [Article] = []
    @State private var searchText: String = ""
    
    var filteredArticles: [Article] {
        if searchText.isEmpty {
            return articles
        } else {
            return articles.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                List(filteredArticles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(article.title)
                                .font(.headline)
                            HStack {
                                Text(article.summary)
                                    .lineLimit(3)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .searchable(text: $searchText, prompt: "Search by title")
            }
            .onAppear {
                articles = JSONLoader.load(from: "articles", as: [Article].self)
                print("Loaded \(articles.count) articles")
            }
        }
    }
}


#Preview {
    ArticlesListView()
}
