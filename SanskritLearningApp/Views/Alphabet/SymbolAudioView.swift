//
//  PronunciationView.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//

import SwiftUI
import AVFoundation

struct SymbolAudioView: View {
    var symbol: Symbol
    @StateObject private var audioPlayer = AudioPlayer()

    var body: some View {
        VStack {
            Button(action: {
                audioPlayer.playSound(named: symbol.symbol)
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    SymbolAudioView(symbol: Symbol(symbol: "अ", transliteration: "a"))
}
