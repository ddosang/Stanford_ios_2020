//
//  MemoryGame.swift
//  Practice
//
//  Created by 임은지 on 2021/02/05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func choose(card: Card) {
        
        if let chosenIndex = cards.firstIndex(matching: card), !card.isFaceUp, !card.isMatched {
            
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            
            
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        //cards.shuffle() //required Tasks 2
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
