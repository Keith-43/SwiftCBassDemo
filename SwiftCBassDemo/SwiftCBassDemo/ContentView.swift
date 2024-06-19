//
//  ContentView.swift
//  SwiftCBassDemo
//
//  Created by Keith Bromley and Treata Nourizi in June 2024.
//

import SwiftUI

struct ContentView: View {

    @Bindable var audioManager: AudioManager
    
    var body: some View {
        ZStack {
            Spectrum()

            HStack {

                Spacer()

                VStack {
                    Button( action: {
                        // Toggling this button converts between live-microphone input and file-play input.
                        audioManager.micOn.toggle()
                        audioManager.stopMusicPlay()
                        audioManager.setupAudio()
                    } ) {
                        Text( (audioManager.micOn) ? "Play Music File" : "Turn Microphone On")
                    }
                    .help("This button turns the microphone on and off.")
                    .buttonStyle(.borderedProminent)

                    Spacer()
                }
            }
        }
    }
}
