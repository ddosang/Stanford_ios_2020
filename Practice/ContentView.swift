//
//  ContentView.swift
//  Practice
//
//  Created by 임은지 on 2021/02/05.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    
    
    var body: some View {
        return HStack {
            
            ForEach(viewModel.cards) { card in
                CardView(card: card)
            }
            
        }.foregroundColor(.orange)
        .padding()
        .font((viewModel.cards.count >= 5) ? Font.body : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10.0).stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(viewModel: EmojiMemoryGame())
        
    }
}
