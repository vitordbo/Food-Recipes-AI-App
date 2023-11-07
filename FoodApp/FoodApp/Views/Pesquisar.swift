//
//  Pesquisar.swift
//  FoodApp
//
//  Created by Student on 06/11/23.
//

import SwiftUI
import Combine

struct RecipeSearchView: View {
    @State private var query = "Chicken Tikka Masala"
    @State private var recipes: [EdamamRecipe] = []
    private let edamamService = EdamamService()
    @State var cancellables = Set<AnyCancellable>()

    var body: some View {
        VStack {
            TextField("Search for a recipe", text: $query)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Search") {
                searchForRecipes()
            }
            .padding()

            List(recipes, id: \.label) { recipe in
                VStack(alignment: .leading) {
                    Text(recipe.label)
                        .font(.headline)
                    Text("Ingredients: \(recipe.ingredients.map { $0.text }.joined(separator: ", "))")
                        .font(.subheadline)
                }
            }

        }
        .onAppear {
            searchForRecipes()
        }
    }

    func searchForRecipes() {
        edamamService.searchRecipe(query: query)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("API Request Error: \(error)")
                }
            }) { response in
                self.recipes = response.hits.map { $0.recipe }
                print("API Response: \(response)")
            }
            .store(in: &cancellables)
    }

    private var cancellableSet: Set<AnyCancellable> = Set()
}

struct RecipeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSearchView()
    }
}

