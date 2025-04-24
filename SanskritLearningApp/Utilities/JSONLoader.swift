//
//  JSONLoader.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//
import Foundation

struct JSONLoader {
    static func load<T: Decodable>(from filename: String, as type: T.Type) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to locate \(filename).json in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(filename).json from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(filename).json from bundle.")
        }

        return loaded
    }
}
