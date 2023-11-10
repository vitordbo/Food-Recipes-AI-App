//
//  HomeView.swift
//  FoodApp
//
//  Created by Student on 30/10/23.
//

import SwiftUI

//https://www.swiftyplace.com/blog/swiftui-search-bar-best-practices-and-examples

struct TabViewHome: View {
    var body: some View {
        
        TabView{
            Group{
                HomeView() // pipocanado com home
                     .tabItem {
                         Label("Home", systemImage: "house.fill")
                     }

                 ChatGPTView()
                     .tabItem {
                         Label("Receitas IA", systemImage: "ellipsis.message.fill")
                     }
                     
                 GroceryListDetailsView()
                     .tabItem {
                         Label("Lista de compras", systemImage: "checklist")
                     }
            }.toolbarBackground(.visible, for: .tabBar)
        }
    }
}
    

struct TabViewHome_Previews: PreviewProvider {
    static var previews: some View {
        TabViewHome()
    }
}
