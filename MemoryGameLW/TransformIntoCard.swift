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
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFacedUp ? 1 : 0)
            base.fill()
                .opacity(isFacedUp ? 0 : 1)
        }.rotation3DEffect(
            .degrees(rotation),axis: (0,1,0)
        )
    }
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func transformIntoCard(isFacedUp: Bool) ->
    some View{
        modifier(TransformIntoCard(isFacedUp: isFacedUp))
    }
}
