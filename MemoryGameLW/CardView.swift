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
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }.opacity(card.isUp ? 1 : 0)
            base.fill().opacity(card.isUp ? 0 : 1)
        }
        
    }
}

