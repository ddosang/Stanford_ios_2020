//
//  GameTheme.swift
//  Practice
//
//  Created by 임은지 on 2021/02/25.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var cardContents: Array<String>
    var numberOfPairsOfCardsToShow: Int?
    var color: Color
    
    
    static let halloween = Theme(name: "Halloween", cardContents: ["👻", "🎃", "🕷", "💀", "🧙‍♂️"], numberOfPairsOfCardsToShow: 5, color: .orange)
    static let sports = Theme(name: "Sports", cardContents: ["⚽️", "🏀", "🏈", "⚾️", "🏐", "🏐", "🥏", "🏓"], numberOfPairsOfCardsToShow: 8, color: .green)
    static let animals = Theme(name: "Animals", cardContents: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊"], color: .yellow)
    static let faces = Theme(name: "Faces", cardContents: ["🥰", "🤩", "🥳", "🤔", "🤫"], color: .gray)
    static let weather = Theme(name: "Weather", cardContents: ["☀️", "⛅️", "☁️", "🌩", "🌧", "❄️"], color: .blue)
    static let snack = Theme(name: "Snack", cardContents: ["🍭", "🍩", "🍪", "🍬", "🍫", "🍦"], color: .purple)
    
    static var themes = [halloween, sports, animals, faces, weather, snack]

    
    /*
    //나는 이런 방식으로 짰는데, viewModel 에서 다시 이 함수를 호출해야하는게 간결하지 못한 코드같아서
    //https://github.com/vaIerika/stanford2020 참고
     
    static var themes = [Theme]()
    
    static func createThemes() {
        themes.append(Theme(name: "halloween", cardContents: ["👻", "🎃", "🕷", "💀", "🧙‍♂️"], numberOfPairsOfCardsToShow: 5, color: .orange))
        themes.append(Theme(name: "sports", cardContents: ["⚽️", "🏀", "🏈", "⚾️", "🏐", "🏐", "🥏", "🏓"], numberOfPairsOfCardsToShow: 8, color: .green))
        themes.append(Theme(name: "animals", cardContents: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊"], color: .yellow))
        themes.append(Theme(name: "faces", cardContents: ["🥰", "🤩", "🥳", "🤔", "🤫"], color: .lightGray))
        themes.append(Theme(name: "weather", cardContents: ["☀️", "⛅️", "☁️", "🌩", "🌧", "❄️"], color: .blue))
        themes.append(Theme(name: "snack", cardContents: ["🍭", "🍩", "🍪", "🍬", "🍫", "🍦"], color: .purple))
    } */
    
}
