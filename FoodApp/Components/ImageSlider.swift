//
//  ImageSlider.swift
//  FoodApp
//
//  Created by Student on 01/11/23.
//

import SwiftUI

struct ImageSlider: View {
    
    private let images = ["lasanha", "fricasse", "coxinha"]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { item in
                 Image(item)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
