//
//  ContentView.swift
//  MemoryGameLW
//
//  Created by student on 14/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView{
                cardList.animation(.default, value: viewModel.cards)
            }
            MotivesButton
                .padding()
        }
        .padding()
        .foregroundColor(viewModel.MotiveColor)
    }
    
    var cardList : some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){
                card in 
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture{
                        viewModel.choose(card: card)
                }
            }
        }
    }
    
    var MotivesButton : some View{
        HStack{
            MotiveButton(viewModel: viewModel, icon: "🫡", text: "Motyw 1", color: Color.blue)
            Spacer()
            MotiveButton(viewModel: viewModel, icon: "🚗", text: "Motyw 2", color: Color.red)
            Spacer()
            MotiveButton(viewModel: viewModel, icon: "🐵", text: "Motyw 3", color: Color.green)
            
        }
    }
}


#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
