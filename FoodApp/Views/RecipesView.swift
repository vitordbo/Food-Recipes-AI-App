import SwiftUI
import Combine

struct RecipeSearchView: View {
    var queryFromHome: String
    
    @State private var query = ""
    @State private var recipes: [EdamamRecipe] = []
    private let edamamService = EdamamService()
    @State var cancellables = Set<AnyCancellable>()
    
    // Crie uma array com as receitas predefinidas, incluindo a primeira que você deseja exibir
    let predefinedRecipes: [EdamamRecipe] = [
        EdamamRecipe(label: "Pipoca de chocolate",
        ingredients: [EdamamIngredient.init(text: "1 xícara de milho para pipoca de boa qualidade", quantity: 10, measure: ""),
        EdamamIngredient.init(text: "6 colheres de sopa de açúcar cristal", quantity: 10, measure: ""),
         EdamamIngredient.init(text: "3 colheres de achocolatado em pó de boa qualidade", quantity: 10, measure: ""),
          EdamamIngredient.init(text: "Água", quantity: 10, measure: "")],
             url: "https://www.tudogostoso.com.br/receita/11371-pipoca-de-chocolate.html", image: "https://www.receitasdemae.com.br/wp-content/uploads/2010/05/pipoca-de-chocolate.jpg"),
    ]
    
    init(queryFromHome: String) {
        self.queryFromHome = queryFromHome
        self._query = State(initialValue: queryFromHome)
    }

    var body: some View {
        VStack {
            TextField("Search for a recipe", text: $query)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Search") {
                searchForRecipes()
            }
            .padding()

            // Combine os dados predefinidos com os dados da API
            List(predefinedRecipes + recipes, id: \.label) { recipe in
                VStack(alignment: .leading) {
                    Text(recipe.label)
                        .font(.headline)
                    
                    Text("Ingredients:")
                        .font(.subheadline)
                        .padding(.top, 4)

                    ForEach(recipe.ingredients, id: \.text) { ingredient in
                        Text("- " + ingredient.text)
                            .font(.subheadline)
                    }
                    
                    Text("") // pular linhas
                    Link("Acesse mais detalhes", destination: URL(string: recipe.url)!)
                    
                    AsyncImage(url: URL(string: recipe.image))
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

/* codigo geral sem o mocado
 //
 //  Pesquisar.swift
 //  FoodApp
 //
 //  Created by Student on 06/11/23.
 //

 import SwiftUI
 import Combine

 struct RecipeSearchView: View {
     var queryFromHome: String
     
     @State private var query = ""
     @State private var recipes: [EdamamRecipe] = []
     private let edamamService = EdamamService()
     @State var cancellables = Set<AnyCancellable>()
     
     init(queryFromHome: String) {
         self.queryFromHome = queryFromHome
         self._query = State(initialValue: queryFromHome)
     }


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
                     
                     Text("Ingredients:")
                         .font(.subheadline)
                         .padding(.top, 4)

                     ForEach(recipe.ingredients, id: \.text) { ingredient in
                         Text("- " + ingredient.text)
                             .font(.subheadline)
                     }
                     
                     Text("") // pular linhas
                     Link("Acesse mais detalhes", destination: URL(string: recipe.url)!)
                     
                     AsyncImage(url: URL(string: recipe.image))
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
 */
