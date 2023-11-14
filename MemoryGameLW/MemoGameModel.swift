//
//  MemoGameModel.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable
{
    private(set) var cardList: Array<Card>
    
//    let icons : [String] = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","👻","🎃","🤢"]
//    let icons2 : [String] = ["🚗","🚕","🚚","🚌","🏎️","🚜","🚑","🛴","🚲","🛵"]
//    let icons3 : [String] = ["🐶","🐱","🐵","🐭","🦊","🐻","🐦","🐔","🐷","🐼"]
//    var kolor : Color = .blue
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->
         CardContent){
        cardList = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cardList.append(Card(content: content, id:"\(pairIndex) a"))
            cardList.append(Card(content: content, id:"\(pairIndex) b"))
        }
    }
    
    mutating func choose(card: Card)
    {
        if let cardIndex = cardList.firstIndex(where: {$0.id == card.id}){
            cardList[cardIndex].isUp.toggle()
        }
    }
    
    mutating func shuffle(){
        cardList.shuffle()
    }
    
    struct Card : Equatable, Identifiable{
        var isUp: Bool = false
        var isPaired: Bool = false
        var content: CardContent
        
        var id: String
    }
}
