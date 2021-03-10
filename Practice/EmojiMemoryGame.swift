//
//  EmojiMemoryGame.swift
//  Practice
//
//  Created by 임은지 on 2021/02/05.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
   
    @Published private var model: MemoryGame<String>
    
    private(set) var theme: Theme
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
       
        let numberOfPairsOfCardsToShow = theme.numberOfPairsOfCardsToShow ?? theme.cardContents.count
        let numberOfCards = 2...numberOfPairsOfCardsToShow
        
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: numberOfCards)) { pairIndex in
            return theme.cardContents[pairIndex]
        }
    }
    

    init() {
        let theme = Theme.themes.randomElement()!
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
        
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card: card)
    }
    
    func resetGame() {
        theme = Theme.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
