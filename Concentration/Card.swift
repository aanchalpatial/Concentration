//
//  Card.swift
//  Concentration
//
//  Created by Aanchal Patial on 01/09/18.
//  Copyright © 2018 AP. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier();
    }
    // TODO: Shuffle the cards
}
