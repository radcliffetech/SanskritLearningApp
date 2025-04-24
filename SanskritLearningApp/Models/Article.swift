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
    let author: String
    let summary: String
    let content: String
    let keywords: [String]

}
