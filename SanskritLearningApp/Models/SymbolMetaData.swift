//
//  SymbolMetaData.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//
import Foundation

struct SymbolMetaData: Identifiable, Codable {
    var id: UUID
    var symbol: String
    var pronunciation: String
    var cosmologicalInfo: String
    var historicalInfo: String
    var energy: String?
    var domain: String?
    var meaning: String?
    var notes: String?
    var primaryVowel: String?
    var secondaryEnergy: String?
    var sanskritCategory: String?
}

// Enriched entries based on the Matrika vowel PDF
let symbolMetaDataEntries: [SymbolMetaData] = [
    SymbolMetaData(id: UUID(), symbol: "ऊ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "uunataa", domain: nil, meaning: "Lessening", notes: "Apprehension about possible loss", primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "ऋ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "amrita bija", domain: nil, meaning: "Residing in his own bliss", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "ॠ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "amrita bija", domain: nil, meaning: "Residing in his own bliss", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "ऌ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "amrita bija", domain: nil, meaning: "Residing in his own bliss", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "ॡ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "amrita bija", domain: nil, meaning: "Residing in his own bliss", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "ए", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "asphuta kriya shakti", domain: nil, meaning: "not vivid energy of action", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "ऐ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "sphuta kriya shakti", domain: nil, meaning: "vivid energy of action", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "ओ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "sphutatara kriya shakti", domain: nil, meaning: "more vivid energy of action", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "औ", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "sphutatama kriya shakti", domain: nil, meaning: "most vivid energy of action", notes: nil, primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "अं", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "anusvara", domain: nil, meaning: "all (unreflected)", notes: "Shiva's existence in its own point", primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),
    SymbolMetaData(id: UUID(), symbol: "अः", pronunciation: "", cosmologicalInfo: "", historicalInfo: "", energy: "visarga", domain: nil, meaning: "all (reflected)", notes: "Shiva bindu/Shakti bindu", primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil)
]
