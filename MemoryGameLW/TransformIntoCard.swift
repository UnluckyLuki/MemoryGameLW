//
//  TransformIntoCard.swift
//  MemoryGameLW
//
//  Created by student on 28/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier {
    init(isFacedUp: Bool) {
        rotation = isFacedUp ? 0 : 180
    }
    var isFacedUp: Bool{
        rotation < 90
    }
    
    var rotation: Double
    
    var animatableData: Double{
        get { rotation }
        set { rotation = newValue }
    }

    
    func body(content: Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            base.strokeBorder(lineWidth: 2)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0 : 1)
            
        }.rotation3DEffect(
            .degrees(rotation),axis: (0,1,0)
        )
    }
}

extension View {
    func transformIntoCard(isFacedUp: Bool) ->
    some View{
        modifier(TransformIntoCard(isFacedUp: isFacedUp))
    }
}
