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
            HStack{
                //removeCard
                //Spacer()
                //addCard
//                MotiveButton(icon: "🫡", text: "Motyw 1", color: $kolor)
//                Spacer()
//                MotiveButton(icon: "🚗", text: "Motyw 2", color: $kolor)
//                Spacer()
//                MotiveButton(icon: "🐵", text: "Motyw 3", color: $kolor)
                
            }
        }
        .padding()
        .foregroundColor(.blue)
    }
    
    var cardList : some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){
                card in CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture{
                        viewModel.choose(card: card)
                }
            }
        }
    }
    
//    var CardDisplay: some View{
//        LazyVGrid(columns:[GridItem(.adaptive(minimum:80))]){
//            ForEach(0..<cardCount, id: \.self){
//                index in CardView(icon: icons[index], color: kolor).aspectRatio(2/3, contentMode: .fit)
//            }
//        }.foregroundColor(kolor)
//    }
//    func adjustCardNumber(by_offset: Int, symbol: String) -> some View{
//        return Button(symbol){
//            if(by_offset+cardCount >= 0 && by_offset+cardCount <= icons.count){
//                cardCount += by_offset
//            }
//        }.frame(width: 60, height: 40).border(kolor)
//    }
//    var addCard: some View{
//        adjustCardNumber(by_offset: 2, symbol: "+").disabled(cardCount == icons.count)
//    }
//    var removeCard: some View{
//        adjustCardNumber(by_offset: -2, symbol: "-").disabled(cardCount < 2)
//    }
}


#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
