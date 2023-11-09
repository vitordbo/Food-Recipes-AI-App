import SwiftUI

struct RecipeDetailsView: View {
    var recipe: EdamamRecipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RecipeHeaderView(recipe: recipe)
                IngredientsView(ingredients: recipe.ingredients)
                NutritionalInfoView(recipe: recipe)
                Link("Acesse mais detalhes", destination: URL(string: recipe.url)!)
            }
        }
    }
}

struct RecipeHeaderView: View {
    var recipe: EdamamRecipe

    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.label)
                .font(.headline)
            AsyncImage(url: URL(string: recipe.image))
        }
    }
}

struct IngredientsView: View {
    var ingredients: [EdamamIngredient]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients:")
                .font(.subheadline)

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
        VStack(alignment: .leading) {
            Text("Nutritional Information:")
                .font(.subheadline)

            Text("Calories = " + String(format: "%.2f", recipe.totalNutrients.ENERC_KCAL.quantity ?? 0) + " " + (recipe.totalNutrients.ENERC_KCAL.unit)).font(.subheadline)
            Text("Saturated Fat = " + String(format: "%.2f", recipe.totalNutrients.FASAT.quantity ?? 0) + " " + (recipe.totalNutrients.FASAT.unit)).font(.subheadline)
            Text("Trans Fat = " + String(format: "%.2f", recipe.totalNutrients.FATRN.quantity ?? 0) + " " + (recipe.totalNutrients.FATRN.unit)).font(.subheadline)
            Text("Carbohydrates = " + String(format: "%.2f", recipe.totalNutrients.CHOCDF.quantity ?? 0) + " " + (recipe.totalNutrients.CHOCDF.unit)).font(.subheadline)
            Text("Proteins = " + String(format: "%.2f", recipe.totalNutrients.PROCNT.quantity ?? 0) + " " + (recipe.totalNutrients.PROCNT.unit)).font(.subheadline)
            Text("Sodium = " + String(format: "%.2f", recipe.totalNutrients.NA.quantity ?? 0) + " " + (recipe.totalNutrients.NA.unit)).font(.subheadline)
            Text("Fiber = " + String(format: "%.2f", recipe.totalNutrients.FIBTG.quantity ?? 0) + " " + (recipe.totalNutrients.FIBTG.unit)).font(.subheadline)
        }
    }
}
