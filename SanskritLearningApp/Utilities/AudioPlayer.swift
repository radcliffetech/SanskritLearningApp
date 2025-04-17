//
//  AudioPlayer.swift
//  SanskritLearningApp
//
//  Created by Jeffrey Radcliffe on 4/17/25.
//


import SwiftUI
import AVFoundation

class AudioPlayer: ObservableObject {
    var player: AVAudioPlayer?

    func playSound(named soundName: String) {
        
        if let url = Bundle.main.url(forResource:soundName, withExtension: "m4a") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            //fall back to syllable-stub.m4a, which I know is there.
            if let url = Bundle.main.url(forResource:"syllable-stub", withExtension: "m4a") {
                print("Error finding sound \(soundName). Falling back to syllable-stub.m4a")
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                } catch {
                    print("Error playing sound: \(error.localizedDescription)")
                }
            }
        }
    }
}
