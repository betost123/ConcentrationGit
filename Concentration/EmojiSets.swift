//
//  EmojiSets.swift
//  Concentration
//
//  Created by Betina Andersson on 2018-09-06.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import Foundation

struct EmojiSets {
    var animals = ["🕊", "🐈", "🐳", "🦕", "🐡", "🦄", "🦐", "🦊", "🐻", "🦁", "🐢", "🦓"]
    var sports = ["⚽️", "🏀", "🏉", "🎾", "🏏", "🚵‍♀️", "🥊", "🎱", "⛹️‍♀️", "⛸", "🏓", "⚾️", "🏋️‍♀️"]
    var food = ["🍏", "🧀", "🍔", "🌮", "🥩", "🥑", "🌶", "🍌", "🌭", "🍟", "🥨", "🍠", "🍓"]
    var weather = ["☀️", "🌈", "❄️", "🌧", "☔️", "⛅️", "💨", "🌦", "🌏", "🌔", "🌟", "☄️", "⚡️"]
    var trees = ["🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🎋", "🍄", "💐", "🌹", "🌷", "🍁", "🎍"]
    var pinks = ["🌸", "🌺", "🌷", "🐷", "👛", "👚", "🎀", "🛍", "💞", "💝", "💖", "👩‍🎤", "🧠"]
    var town = ["🏎", "🚢", "🚧", "🚤", "🚊", "🚜", "⛰", "🌋", "🏕", "🏣", "💒", "🏛", "🌁"]
    var defaultSet = ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🏙", "🌉", "🌌", "🌁"]
    
    func returnEmojiSet() -> [String] {
        let randomIndex = Int(arc4random_uniform(UInt32(7)))
        var collection = [animals, sports, food, weather, trees, pinks, town, defaultSet]
        
        return collection[randomIndex].count > 0 ? collection[randomIndex] : defaultSet
        
    }
}


