//
//  EmojiSets.swift
//  Concentration
//
//  Created by Betina Andersson on 2018-09-06.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import Foundation

struct EmojiSets {
    private var animals = ["🕊", "🐈", "🐳", "🦕", "🐡", "🦄", "🦐", "🦊", "🐻", "🦁", "🐢", "🦓"]
    private var sports = ["⚽️", "🏀", "🏉", "🎾", "🏏", "🚵‍♀️", "🥊", "🎱", "⛹️‍♀️", "⛸", "🏓", "⚾️", "🏋️‍♀️"]
    private var food = ["🍏", "🧀", "🍔", "🌮", "🥩", "🥑", "🌶", "🍌", "🌭", "🍟", "🥨", "🍠", "🍓"]
    private var weather = ["☀️", "🌈", "❄️", "🌧", "☔️", "⛅️", "💨", "🌦", "🌏", "🌔", "🌟", "☄️", "⚡️"]
    private var trees = ["🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🎋", "🍄", "💐", "🌹", "🌷", "🍁", "🎍"]
    private var pinks = ["🌸", "🌺", "🌷", "🐷", "👛", "👚", "🎀", "🛍", "💞", "💝", "💖", "👩‍🎤", "🧠"]
    private var town = ["🏎", "🚢", "🚧", "🚤", "🚊", "🚜", "⛰", "🌋", "🏕", "🏣", "💒", "🏛", "🌁"]
    private var defaultSet = ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🏙", "🌉", "🌌", "🌁"]
    
    func returnEmojiSet() -> [String] {
        let randomIndex = Int(arc4random_uniform(UInt32(7)))
        var collection = [animals, sports, food, weather, trees, pinks, town, defaultSet]
        
        return collection[randomIndex].count > 0 ? collection[randomIndex] : defaultSet
        
    }
}


