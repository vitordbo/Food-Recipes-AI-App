//
//  HomeView.swift
//  FoodApp
//
//  Created by Student on 30/10/23.
//

import SwiftUI

//https://www.swiftyplace.com/blog/swiftui-search-bar-best-practices-and-examples

struct HomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            NavigationStack {
                Text("Searching for \(searchText)")
            }
            .searchable(text: $searchText)
        }
    }
}
       

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
