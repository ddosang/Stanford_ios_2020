//
//  MemoryGame.swift
//  Practice
//
//  Created by 임은지 on 2021/02/05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    
    var score: Int
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    var isPreviousSeenCard: [Int] //원래는 이 배열을 Bool로 놓고 isPreviousSeencArd[chosenIndex] = true 를 넣어서 체크를 하려고 했는데,
    //처음으로 두 장 뒤집었는데, 첫번쨰 뒤집힌 카드의 isPreviousSeenCard가 true라서 처음 두장 뒤집엇는데도 -1점 이 됨...
    //그래서 Int로 바꾸어서 2번 뒤집혔을 때 부터 동작하도록..
    //Bool로 바꿀 수 있다면 바꾸고 싶음.
    
    mutating func choose(card: Card) {
        
        if let chosenIndex = cards.firstIndex(matching: card), !card.isFaceUp, !card.isMatched {
            
            
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if (isPreviousSeenCard[potentialMatchIndex] >= 2) || (isPreviousSeenCard[chosenIndex] >= 2) {
                        score -= 1
                    }
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            isPreviousSeenCard[chosenIndex] += 1
        }
    }
    
    func computeScore() -> Int {
        return score
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        score = 0
        isPreviousSeenCard = [Int]()
        cards = Array<Card>()
        
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            
            isPreviousSeenCard.append(0)
            isPreviousSeenCard.append(0)
        }
        
        cards.shuffle()
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
