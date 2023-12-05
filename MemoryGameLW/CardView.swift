//
//  CardView.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//

import SwiftUI

struct CardView: View {
    
    let card: MemoGameModel<String>.Card
    
    init(card: MemoGameModel<String>.Card) {
        self.card = card
    }
    
    
    var body: some View {
        
        
        CirclePart(endAngle: .degrees(250))
            .overlay{Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 2), value: card.isMatched)
            }
            .padding(4)
            .transformIntoCard(isFacedUp: card.isFacedUp)
            .opacity(card.isFacedUp || !card.isMatched ? 1 : 0)
    }
    
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 2).repeatForever(autoreverses: false)
    }
}
