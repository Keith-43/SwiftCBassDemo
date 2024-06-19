//
//  SwiftCBassDemoApp.swift
//  SwiftCBassDemo
//
//  Created by Keith Bromley and Treata Nourizi in June 2024.
//

import SwiftUI

@main
struct SwiftCBassDemoApp: App {
    
    @Bindable var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(audioManager: audioManager)
                .environment(audioManager)

        }
    }
}
