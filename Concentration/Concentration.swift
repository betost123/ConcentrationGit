//
//  Concentration.swift
//  Concentration
//
//  Created by Betina Andersson on 2018-09-06.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var flipCount = 0
    private(set) var score = 0
    private(set) var cards = [Card]()
    private(set) var emojiSet = [String]()
    private var es = EmojiSets()
    
    private var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard(at index : Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard: index not in card collection")
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
                cards[index].flipped += 1
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                    cards[index].missmatches += 1
                }
                if (cards[index].flipped > 1 && cards[index].missmatches > 0) {
                    score -= 1
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = index
                cards[index].flipped += 1
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
        var items = cards.count - 1
        while (items > 0) {
            let rand = Int(arc4random_uniform(UInt32(items)))
            if (rand != items) {cards.swapAt(items, rand)}
            items -= 1
        }
    }
    
}
