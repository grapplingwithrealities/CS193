//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tony Pearo on 11/14/22.
//

import Foundation

// CardContent is a don't care
// Now a mostly don't care that is able to use the '==' operator
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? //init to nil
    
    mutating func choose(_ card: Card) {
        // $0 is an iterator through the array of Cards
        // The "," in the if here acts as an && except it works for let
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
    }
    
    // This whole comment block is an intro to optionals
//    // _ denotes using no argument label
//    mutating func choose(_ card: Card) {
//        if let chosenIndex = index(of: card) {
//            cards[chosenIndex].isFaceUp.toggle()
//        }
//
//        // This would crash the app if it had a nil
//        //cards[chosenIndex!].isFaceUp.toggle()
//
//        print("\(cards)")
//    }
//
//    // "of card:" allows of as external and card as internal var
//    // optional<Int>
//    func index(of card: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    // Nested in here since it is a memory game card
    // Identifiable requires an id
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // don't care var
        var id: Int
    }
}
