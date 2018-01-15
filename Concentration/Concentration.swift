//
//  Concentration.swift
//  Concentration
//
//  Created by Bin Wang on 2018-01-15.
//  Copyright © 2018 Bin Wang. All rights reserved.
//

import Foundation

class Concentration  {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    func chooseCard(at index : Int)  {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards : Int) {
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        for index in cards.indices {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let tempCard = cards[index]
            cards[index] = cards[randomIndex]
            cards[randomIndex] = tempCard
        }
    }
}
