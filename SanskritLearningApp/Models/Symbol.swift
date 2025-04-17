//
//  Symbol.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import Foundation

public struct Symbol: Identifiable, Codable, Hashable {
    public let symbol: String       // Sanskrit character
    public let transliteration: String  // Transliteration

    public var id: String { symbol } // Use `symbol` as the unique identifier

    public static let testSymbol1 = Symbol(symbol: "आ", transliteration: "ā")
}
