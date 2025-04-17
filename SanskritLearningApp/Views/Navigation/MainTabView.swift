//
//  MainTabView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var showingAbout = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView {
                    WelcomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    QuizWelcomeView()
                        .tabItem {
                            Label("Quiz", systemImage: "graduationcap")
                        }
                    
                    AlphabetWelcomeView()
                        .tabItem {
                            Label("Alphabet", systemImage: "character.book.closed")
                        }
                    ArticlesListView()
                        .tabItem {
                            Label("Learn", systemImage: "book.fill")
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAbout = true
                    }) {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAbout) {
                AboutView()
            }
        }
    }
}

#Preview {
    MainTabView()
}
