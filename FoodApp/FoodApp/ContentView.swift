//
//  ContentView.swift
//  FoodApp
//
//  Created by Student on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isButton = false
    var body: some View {
        
        NavigationView{
            ZStack{
                Color(.red).opacity(0.7).ignoresSafeArea()
                VStack{
                    Image("Image").resizable().scaleEffect(0.7)
                    Text("Livro de Receitas")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    NavigationLink(destination: LoginPage(),isActive: $isButton){
                       
                        Button(action: {
                           
                            isButton = true
                            
                        }){
                            HStack{
                                Text("Entrar               ").fontWeight(.bold).font(.title3)
                            }.padding()
                                .foregroundColor(.white)
                                .background(.yellow)
                                .cornerRadius(10)
                                .padding(.top,100)

                                
                        }
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

