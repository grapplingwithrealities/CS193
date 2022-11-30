//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Tony Pearo on 11/10/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
