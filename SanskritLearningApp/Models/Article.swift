//
//  Article.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//
import Foundation


struct Article: Identifiable, Codable {
    let id: UUID
    let title: String
    let tags: [String]
    let content: String
}
