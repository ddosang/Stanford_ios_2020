//
//  ContentView.swift
//  Practice
//
//  Created by 임은지 on 2021/02/05.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        return HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }.aspectRatio(2/3, contentMode: .fit)
            }
            
        }.foregroundColor(.orange)
        .padding()
            }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 2.0
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * fontScaleFactor
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        
    }
}
