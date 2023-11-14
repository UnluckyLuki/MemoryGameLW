//
//  MotiveButton.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//

import SwiftUI

struct MotiveButton: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    var icon: String
    var text: String
    var color: Color
    var body: some View {
        Button(action: {
            viewModel.changeMotive(color: color)
        }){
            VStack{
                Text(icon)
                Text(text)
            }
                }.frame(width: 100, height: 40).frame(height: 15)
    }
}

#Preview {
    MotiveButton(viewModel: MemoGameViewModel(), icon: "☺️", text: "Motive 1", color: Color.blue)
}
