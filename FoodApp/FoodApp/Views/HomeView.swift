//
//  HomeView.swift
//  FoodApp
//
//  Created by Student on 31/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
       
        ZStack{
            
            
            //Color(.red).opacity(0.7).ignoresSafeArea()
            ScrollView {
                
            VStack {
                    
                TextField( "Pesquis sua receita",text: $searchText).multilineTextAlignment(.center)
                    .font(.title3)
                    .padding(.horizontal,10)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 10)
                    .padding(.top,20)
                
                
                    
                    
              NavigationView {
                  List {
                      ImageSlider()
                          .frame(height: 200)
                          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                  }
                  
              }.padding(.top,20)
              .navigationBarBackButtonHidden(true)
              .navigationBarHidden(true)
     
            
                
                  
                    Text("Bem-vindo")
                    Text("Isso foi oq vc viu recentemente")
                    
                    // colocar em um for each para aparecer varias diferentes
                    // colocar scroll view tbm (talvez no vStack)
                    HStack {
                        Image("lasanha").scaledToFit().frame(width: 220, height: 120).scaleEffect(0.25)
                        Spacer()
                        VStack{
                            Text("Receita top 1")
                            Text("Tempo 15")
                            Text("⭐️⭐️⭐️⭐️⭐️")
                        }.padding(.trailing, 30)
                    }.padding(.bottom, 20)
                    
                    HStack { // colocar em um for each
                        Image("lasanha").scaledToFit().frame(width: 220, height: 120).scaleEffect(0.25)
                        Spacer()
                        VStack{
                            Text("Receita top 1")
                            Text("Tempo 15")
                            Text("⭐️⭐️⭐️⭐️⭐️")
                        }.padding(.trailing, 30)
                    }
                }
            }
        }
    }
}
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }

