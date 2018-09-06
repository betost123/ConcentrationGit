//
//  Concentration.swift
//  Concentration
//
//  Created by Betina Andersson on 2018-09-06.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import Foundation

class Concentration {
    var flipCount = 0
    var score = 0
    var cards = [Card]()
    var emojiSet = [String]()
    var es = EmojiSets()
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard(at index : Int) {
        flipCount += 1
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    
    
    init(numberOfPairsOfCards : Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            emojiSet = es.returnEmojiSet()
        }
        // Shuffle cards
        var items = cards.count/2 - 1
        while (items > 0) {
            let rand = Int(arc4random_uniform(UInt32(items)))
            if (rand != items) {cards.swapAt(items, rand)}
            items -= 1
        }
    }
}
