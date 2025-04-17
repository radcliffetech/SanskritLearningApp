//
//  AlphabetWelcomeView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI


struct AlphabetWelcomeView: View {
    @State private var symbols: [Symbol] = []
    @State private var metadata: [SymbolMetaData] = []
    @State private var selectedSymbol: SymbolMetaData?
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 4)
    
    var body: some View {
        ScrollView {
            // Alphabet Section
            alphabetSection
        }
        .padding(.top)
        .onAppear(perform: loadSymbols)
        .sheet(item: $selectedSymbol) { symbolData in
            SymbolDetailView(
                symbol: getSymbolForMetadata(symbolData),
                symbolData: symbolData,
            )
        }
    }
    
    private var metadataMap: [String: SymbolMetaData] {
        Dictionary(uniqueKeysWithValues: metadata.map { ($0.symbol, $0) })
    }
    
    private func getSymbolForMetadata(_ metadata: SymbolMetaData) -> Symbol {
        return symbols.first { $0.symbol == metadata.symbol } ?? Symbol(symbol: "", transliteration: "")
    }
}

private extension AlphabetWelcomeView {
    
    private func loadSymbols() {
        symbols = JSONLoader.load(from: "symbol-list", as: [Symbol].self)
        metadata = JSONLoader.load(from: "symbol-metadata", as: [SymbolMetaData].self)
    }
}

private extension AlphabetWelcomeView {
    // MARK: - Helper Views and Methods
    
    private var alphabetSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Section {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(symbols, id: \.symbol) { symbol in
                        SymbolTileView(symbol: symbol) {
                            if let meta = metadataMap[symbol.symbol] {
                                selectedSymbol = meta
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
    
    struct SymbolTileView: View {
        let symbol: Symbol
        let onTap: () -> Void
        
        var body: some View {
            VStack(spacing: 8) {
                Text(symbol.symbol)
                    .font(.largeTitle)
                Text(symbol.transliteration)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .onTapGesture(perform: onTap)
        }
    }
}
    
#Preview {
    AlphabetWelcomeView()
}
