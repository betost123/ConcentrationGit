//
//  Card.swift
//  Concentration
//
//  Created by Betina Andersson on 2018-09-06.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier : Int
    var flipped = 0
    var missmatches = 0
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

