//
//  Concentration.swift
//  Concentration
//
//  Created by Bin Wang on 2018-01-15.
//  Copyright © 2018 Bin Wang. All rights reserved.
//

import Foundation

struct Concentration  {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard : Int?{
        get{
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        foundIndex = nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index : Int)  {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
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
            cards.swapAt(index, cards.count.arc4random)
        }
    }
}
