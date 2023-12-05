//
//  MemoGameViewModel.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//
import Foundation
import SwiftUI

class MemoGameViewModel: ObservableObject {
    
    private static var icons = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","👻","🎃","🤢"]
    private var icons1 = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","👻","🎃","🤢"]
    private var icons2 = ["🚗","🚕","🚚","🚌","🏎️","🚜","🚑","🛴","🚲","🛵"]
    private var icons3 = ["🐶","🐱","🐵","🐭","🦊","🐻","🐦","🐔","🐷","🐼"]
    
    @Published private var model: MemoGameModel<String> = createGame()
    
    private static func createGame() -> MemoGameModel<String>{
        MemoGameModel(numberOfPairsOfCards: 10){
            index in
            if icons.indices.contains(index){
                return icons[index]
            }
            return "??"
        }
    }
    
    var cards : Array<MemoGameModel<String>.Card>{
        return model.cards
    }
    
    var points : Int {
        return model.points
    }
    
    
    func choose(card: MemoGameModel<String>.Card){
        model.choose(card: card)
    }
    
    
    
    func shuffle(){
        model.shuffle()
    }
    
    @Published var MotiveColor = Color.blue
    
    func changeMotive(color: Color){
        MotiveColor = color
        switch color {
        case .blue: MemoGameViewModel.icons = icons1
        case .red: MemoGameViewModel.icons = icons2
        case .green: MemoGameViewModel.icons = icons3
        default: MemoGameViewModel.icons = icons1
        }
        model = MemoGameViewModel.createGame()
    }
    
}

