//
//  Concentration.swift
//  Concentration
//
//  Created by Aanchal Patial on 01/09/18.
//  Copyright © 2018 AP. All rights reserved.
//

import Foundation



struct Concentration{
    
    //var cards = [Card]()
    private(set) var cards = [Card]()
    
    private var indexOfAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if foundIndex == nil {
                    foundIndex = index
                }
                else {
                    return nil
                }
            }
            return foundIndex
        }
        set(newValue){
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)):chosen index is not in cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfAndOnlyFaceUpCard, matchIndex != index {
                //check if cards matches
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                //indexOfAndOnlyFaceUpCard = nil
            }
            else {
                /*//either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true*/
                indexOfAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): u must hv atleast one pair")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
    }
}
