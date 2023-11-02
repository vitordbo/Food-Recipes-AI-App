//
//  FriendsView.swift
//  FoodApp
//
//  Created by Student on 31/10/23.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        ZStack{
            VStack {
                ScrollView {
                    Text("Veja o que seus amigos estao fazendo").font(.title).fontWeight(.bold)
                    
                    // colocar em um for each para aparecer varias diferentes
                    // colocar scroll view tbm (talvez no vStack)
                    HStack {
                        Image("lasanha").scaledToFit().frame(width: 220, height: 120).scaleEffect(0.25)
                        Spacer()
                        VStack{
                            Text("Vitor")
                            Text("Receita top 1")
                            Text("⭐️⭐️⭐️⭐️⭐️")
                        }.padding(.trailing, 30)
                    }.padding(.bottom, 20)
                    
                    HStack { // colocar em um for each
                        Image("fricasse").scaledToFit().frame(width: 220, height: 120).scaleEffect(0.2)
                        Spacer()
                        VStack{
                            Text("Ricfardo")
                            Text("Receita top 1")
                            Text("⭐️⭐️⭐️⭐️⭐️")
                        }.padding(.trailing, 30)
                    }
                }
            }.padding(.top, 10)
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
