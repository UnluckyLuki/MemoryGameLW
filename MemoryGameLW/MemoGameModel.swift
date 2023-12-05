//
//  MemoGameModel.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable
{
    private(set) var cards: Array<Card>
    
    public var points: Int
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->
         CardContent){
        cards = []
        points = 0
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id:"\(pairIndex) a"))
            cards.append(Card(content: content, id:"\(pairIndex) b"))
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter {
            index in cards[index].isFacedUp }.only}
        set {cards.indices.forEach{
            cards[$0].isFacedUp = (newValue == $0)
        }}
    }
    
    mutating func choose(card: Card)
    {
        if let cardIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[cardIndex].isFacedUp && !cards[cardIndex].isMatched {
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[cardIndex].content == cards[potentialMatchedIndex].content {
                        cards[cardIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                        points = points + 4
                    }
                    if cards[cardIndex].hasBeenSeen{
                        points = points - 1
                    }
                    if cards[potentialMatchedIndex].hasBeenSeen{
                        points = points - 1
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = cardIndex
                }
                cards[cardIndex].isFacedUp = true
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card : Equatable, Identifiable{
        var isFacedUp = false {
            didSet {
                if oldValue && !isFacedUp {
                    hasBeenSeen = true
                }
            }
         }
        var isMatched: Bool = false
        var content: CardContent
        var hasBeenSeen: Bool = false
        
        var id: String
    }
}

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}
