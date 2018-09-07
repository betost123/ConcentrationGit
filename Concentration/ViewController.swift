//
//  ViewController.swift
//  Concentration
//
//  Created by Betina Andersson on 2018-09-06.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: 8)
    lazy var emojiSet = game.emojiSet
    
    @IBOutlet private var cardButton: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBAction func tocuhCard(_ sender: UIButton) {
        if let cardNumber = cardButton.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBAction private func newGameButton(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: 16)
        emojiSet = game.emojiSet
    }
    
    private func updateViewFromModel() {
        flipCountLabel.text = "Flip count: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
        for index in cardButton.indices {
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.2893611789, green: 0.3166740239, blue: 0.3312590122, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    
    private var emoji = [Int:String]()
    private func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil, emojiSet.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiSet.count)))
            emoji[card.identifier] = emojiSet.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "❌"
    }
    

}

