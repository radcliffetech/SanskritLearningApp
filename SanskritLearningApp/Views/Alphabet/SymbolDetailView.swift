//
//  CharacterDetailView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI

struct SymbolDetailView: View {
    let symbol: Symbol
    let symbolData: SymbolMetaData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(symbolData.symbol)
                    .font(.system(size: 80))
                    .bold()

                HStack {
                    Text("Transliteration: \(symbolData.pronunciation)")
                        .font(.headline)
                    Spacer()
                    SymbolAudioView(symbol: symbol)
                        .scaleEffect(0.8)
                }
                if let meaning = symbolData.meaning {
                    Divider()
                    Text("Meaning")
                        .font(.title2)
                        .bold()
                    Text(meaning)
                        .font(.body)
                }
                
                if let notes = symbolData.notes {
                    Divider()
                    Text("Notes")
                        .font(.title2)
                        .bold()
                    Text(notes)
                        .font(.body)
                }
                

                if let energy = symbolData.energy {
                    Divider()
                    Text("Energy")
                        .font(.title2)
                        .bold()
                    Text(energy)
                        .font(.body)
                }

                if let domain = symbolData.domain {
                    Divider()
                    Text("Domain")
                        .font(.title2)
                        .bold()
                    Text(domain)
                        .font(.body)
                }


                if let primaryVowel = symbolData.primaryVowel {
                    Divider()
                    Text("Primary Vowel")
                        .font(.title2)
                        .bold()
                    Text(primaryVowel)
                        .font(.body)
                }

                if let secondaryEnergy = symbolData.secondaryEnergy {
                    Divider()
                    Text("Secondary Energy")
                        .font(.title2)
                        .bold()
                    Text(secondaryEnergy)
                        .font(.body)
                }

                if let sanskritCategory = symbolData.sanskritCategory {
                    Divider()
                    Text("Sanskrit Category")
                        .font(.title2)
                        .bold()
                    Text(sanskritCategory)
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle(symbolData.symbol)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SymbolDetailView(
        symbol: Symbol(symbol: "ऊ", transliteration: "a"),
        symbolData: SymbolMetaData(id: UUID(), symbol: "ऊ", pronunciation: "a", cosmologicalInfo: "From the cosmos!", historicalInfo: "Woooo", energy: "uunataa", domain: nil, meaning: "Lessening", notes: "Apprehension about possible loss", primaryVowel: nil, secondaryEnergy: nil, sanskritCategory: nil),)
}
