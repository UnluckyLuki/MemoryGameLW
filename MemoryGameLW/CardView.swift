//
//  CardView.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//

import SwiftUI

struct CardView: View {
    @State var state: Bool = true
    var icon : String
    var color: Color
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(icon).font(.largeTitle)
            }.opacity(state ? 1 : 0)
            base.fill(color).opacity(state ? 0 : 1)
        }.onTapGesture{
            state.toggle()
        }
    }
}

#Preview {
    CardView(state: true, icon: "☺️", color: .blue)
}
