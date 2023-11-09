import SwiftUI

struct RecipeDetailsView: View {
    var recipe: EdamamRecipe

    var body: some View {
        ScrollView {
                  VStack {
                      RecipeHeaderView(recipe: recipe)
                          .padding()
                      NutritionalInfoView(recipe: recipe) // Movido para cima
                          .padding()
                      IngredientsView(ingredients: recipe.ingredients) // Movido para baixo
                          .padding()
                      Link("Acesse mais detalhes", destination: URL(string: recipe.url)!)
                          .padding()
                  }
              }
              .navigationBarTitle(Text("Detalhes da Receita"), displayMode: .inline)
          }
      }

struct RecipeHeaderView: View {
    var recipe: EdamamRecipe

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(recipe.label)
                .font(.title)
                .fontWeight(.bold)
            AsyncImage(url: URL(string: recipe.image))
                .frame(width: 200, height: 200)
                .cornerRadius(10)
        }
    }
}

struct IngredientsView: View {
    var ingredients: [EdamamIngredient]

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Ingredientes:")
                .font(.headline)
                .fontWeight(.bold)

            ForEach(ingredients, id: \.text) { ingredient in
                Text("- " + ingredient.text)
                    .font(.subheadline)
            }
        }
    }
}

struct NutritionalInfoView: View {
    var recipe: EdamamRecipe

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Informação Nutricional Detalhada:")
                .font(.headline)
                .fontWeight(.bold)

            Text("Calorias: \(String(format: "%.2f", recipe.totalNutrients.ENERC_KCAL.quantity ?? 0)) \(recipe.totalNutrients.ENERC_KCAL.unit)")
            Text("Gordura Saturada: \(String(format: "%.2f", recipe.totalNutrients.FASAT.quantity ?? 0)) \(recipe.totalNutrients.FASAT.unit)")
            Text("Gordura Trans: \(String(format: "%.2f", recipe.totalNutrients.FATRN.quantity ?? 0)) \(recipe.totalNutrients.FATRN.unit)")
            Text("Carboidratos: \(String(format: "%.2f", recipe.totalNutrients.CHOCDF.quantity ?? 0)) \(recipe.totalNutrients.CHOCDF.unit)")
            Text("Proteínas: \(String(format: "%.2f", recipe.totalNutrients.PROCNT.quantity ?? 0)) \(recipe.totalNutrients.PROCNT.unit)")
            Text("Sódio: \(String(format: "%.2f", recipe.totalNutrients.NA.quantity ?? 0)) \(recipe.totalNutrients.NA.unit)")
            Text("Fibras: \(String(format: "%.2f", recipe.totalNutrients.FIBTG.quantity ?? 0)) \(recipe.totalNutrients.FIBTG.unit)")
        }
    }
}
