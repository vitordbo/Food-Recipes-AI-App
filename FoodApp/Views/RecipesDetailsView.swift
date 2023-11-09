//
//  RecipesDetailsView.swift
//  FoodApp
//
//  Created by Student on 08/11/23.
//

import SwiftUI
    
struct RecipeDetailsView: View {
        var recipe: EdamamRecipe
        
        var body: some View {
            VStack {
                Text(recipe.label)
                    .font(.headline)
                // Outras informações, como ingredientes e detalhes nutricionais, podem ser exibidas aqui
            }
        }
    }

