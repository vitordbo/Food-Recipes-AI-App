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
        VStack{
            NavigationStack {
                Text("Searching for \(searchText)")
            }
            .searchable(text: $searchText)
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
