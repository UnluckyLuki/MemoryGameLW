//
//  MotiveButton.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//

import SwiftUI

struct MotiveButton: View {
    var icon: String
    var text: String
    @Binding var color: Color
    var body: some View {
        Button(action: {
            if(icon == "🫡"){
                color = .blue
            }
            if(icon == "🚗"){
                color = .red
            }
            if(icon == "🐵"){
                color = .green
            }
        }){
            VStack{
                Text(icon)
                Text(text)
            }
                }.frame(width: 100, height: 40)
                    .foregroundColor(color).tint(color).frame(height: 15)
    }
}

#Preview {
    MotiveButton(icon: "😀", text: "Motyw 1", color: .constant(.blue))
}
