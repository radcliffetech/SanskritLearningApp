//
//  JSONLoader.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//
import Foundation

class JSONLoader {
    static func load<T: Decodable>(from fileName: String, as type: T.Type) -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let result = try? JSONDecoder().decode(T.self, from: data) else {
            return [] as! T
        }
        return result
    }
}
