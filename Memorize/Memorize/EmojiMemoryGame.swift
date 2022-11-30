//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tony Pearo on 11/14/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🌵","🌹","🍀","🌲","🌴","🌳","🪴","🎋","🍁","🌺","🌸","🪷","🌼","🌻","🎍","🌱"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    // Emoji String CardContent
    // private access control protects
    // Can look at a private(set) but can't change it
    // Has to be a var so that the model can mutate
    // @Published notifies the world that this thing
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(_ )
}
