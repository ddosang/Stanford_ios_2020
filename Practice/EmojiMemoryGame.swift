//
//  EmojiMemoryGame.swift
//  Practice
//
//  Created by 임은지 on 2021/02/05.
//

import SwiftUI


func cardContentFactory(pairIndex: Int) -> String {
    return "😳"
}


class EmojiMemoryGame: ObservableObject {
   
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "💀", "🧙‍♂️"]
        
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        //model.cards.shuffle()
        return model.cards
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card: card)
    }

    
}
