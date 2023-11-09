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
     // colcoar o on appear
    @State private var query = ""
    @State private var recipes: [EdamamRecipe] = []
    private let edamamService = EdamamService()
    @State var cancellables = Set<AnyCancellable>()
    @State private var isButton = false
    @State private var selectedRecipe: EdamamRecipe // Variável para armazenar o item selecionado
    
    // Crie uma array com as receitas predefinidas, incluindo a primeira que você deseja exibir
    let predefinedRecipes: [EdamamRecipe] = [
            EdamamRecipe(label: "Pipoca de chocolate",
                         ingredients: [EdamamIngredient.init(text: "1 xícara de milho para pipoca de boa qualidade", quantity: 10, measure: ""),
                                       EdamamIngredient.init(text: "6 colheres de sopa de açúcar cristal", quantity: 10, measure: ""),
                                       EdamamIngredient.init(text: "3 colheres de achocolatado em pó de boa qualidade", quantity: 10, measure: ""),
                                       EdamamIngredient.init(text: "Água", quantity: 10, measure: "")],
                         url: "https://www.tudogostoso.com.br/receita/11371-pipoca-de-chocolate.html", image: "https://www.receitasdemae.com.br/wp-content/uploads/2010/05/pipoca-de-chocolate.jpg", calories: 150, totalTime: 10, totalNutrients: TotalNutrients(
                            ENERC_KCAL: Enerc_Kcal(label: "Energy", quantity: 805.25, unit: "kcal"),
                            FASAT: Fasat(label: "Saturated Fat", quantity: 2.31, unit: "g"),
                            FATRN: Fatrn(label: "Trans Fat", quantity: 0.0, unit: "g"),
                            CHOCDF: Chocdf(label: "Carbohydrates", quantity: 25.0, unit: "g"),
                            PROCNT: Procnt(label: "Protein", quantity: 8.0, unit: "g"),
                            NA: Na(label: "Sodium", quantity: 500.0, unit: "mg"),
                            FIBTG: Fibtg(label: "Dietary Fiber", quantity: 4.5, unit: "g")
                         )
            )
        ]
    
    init(queryFromHome: String) {
        self.queryFromHome = queryFromHome
        self._query = State(initialValue: queryFromHome)
        selectedRecipe = (EdamamRecipe(label: "Pipoca de chocolate",
                    ingredients: [EdamamIngredient.init(text: "1 xícara de milho para pipoca de boa qualidade", quantity: 10, measure: ""),
                                  EdamamIngredient.init(text: "6 colheres de sopa de açúcar cristal", quantity: 10, measure: ""),
                                  EdamamIngredient.init(text: "3 colheres de achocolatado em pó de boa qualidade", quantity: 10, measure: ""),
                                  EdamamIngredient.init(text: "Água", quantity: 10, measure: "")],
                    url: "https://www.tudogostoso.com.br/receita/11371-pipoca-de-chocolate.html", image: "https://www.receitasdemae.com.br/wp-content/uploads/2010/05/pipoca-de-chocolate.jpg", calories: 150, totalTime: 10, totalNutrients: TotalNutrients(
                       ENERC_KCAL: Enerc_Kcal(label: "Energy", quantity: 805.25, unit: "kcal"),
                       FASAT: Fasat(label: "Saturated Fat", quantity: 2.31, unit: "g"),
                       FATRN: Fatrn(label: "Trans Fat", quantity: 0.0, unit: "g"),
                       CHOCDF: Chocdf(label: "Carbohydrates", quantity: 25.0, unit: "g"),
                       PROCNT: Procnt(label: "Protein", quantity: 8.0, unit: "g"),
                       NA: Na(label: "Sodium", quantity: 500.0, unit: "mg"),
                       FIBTG: Fibtg(label: "Dietary Fiber", quantity: 4.5, unit: "g")
                    )
     )  )
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
            ScrollView{
                // Combine os dados predefinidos com os dados da API
                
                VStack{
                    ForEach(predefinedRecipes + recipes, id: \.label) { recipe in
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
                            
                            AsyncImage(url: URL(string: recipe.image)).frame(width: 350)
                            
                            
                        }
                        HStack {
                            Button(action: {
                                isButton = true
                                // Implemente a lógica para favoritar o item aqui
                                // Por exemplo, adicione o item a uma lista de favoritos
                            }, label: {
                                
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 35,height: 35)
                                    .foregroundColor(.red)
                            }).padding(.horizontal,10)
                            
                            Button(action: {
                                // Ação para visualizar o item
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 35,height: 35)
                                    .foregroundColor(.yellow)
                            }).padding(.horizontal,10)
                            
                            Button(action: {
                                selectedRecipe = recipe
                                isButton = true
                            }, label: {
                                Image(systemName: "list.bullet.rectangle.portrait.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.blue)
                            }).padding(.horizontal, 10).navigationDestination(isPresented: $isButton){
                                RecipeDetailsView(recipe: selectedRecipe)
                                Text("").hidden()
                            }

                        }
                    }
                }
            }
            .onAppear {
                searchForRecipes()
            }
        }
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

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSearchView(queryFromHome: "chocolate")
    }
}

