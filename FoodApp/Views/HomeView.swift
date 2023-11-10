//
//  HomeView.swift
//  FoodApp
//
//  Created by Student on 31/10/23.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct HomeView: View {
    @State private var searchText = ""
    @State private var isButton = false
    
    let predefinedRecipes: [EdamamRecipe] = [
        EdamamRecipe(label: "Pipoca de Chocolate Crocante",
                     ingredients: [EdamamIngredient.init(text: "1 xícara de milho para pipoca de boa qualidade", quantity: 1, measure: "xícara"),
                                   EdamamIngredient.init(text: "6 colheres de sopa de açúcar cristal", quantity: 6, measure: "colheres de sopa"),
                                   EdamamIngredient.init(text: "3 colheres de achocolatado em pó", quantity: 3, measure: "colheres"),
                                   EdamamIngredient.init(text: "Água", quantity: 1, measure: "xícara")],
                     url: "https://www.tudogostoso.com.br/receita/11371-pipoca-de-chocolate.html",
                     image: "https://www.receitasdemae.com.br/wp-content/uploads/2010/05/pipoca-de-chocolate.jpg",
                     calories: 477,
                     totalTime: 20,
                     totalNutrients: TotalNutrients(
                        ENERC_KCAL: Enerc_Kcal(label: "Energia", quantity: 477, unit: "kcal"),
                        FASAT: Fasat(label: "Gordura Saturada", quantity: 18, unit: "g"),
                        FATRN: Fatrn(label: "Gordura Trans", quantity: 0.0, unit: "g"),
                        CHOCDF: Chocdf(label: "Carboidratos", quantity: 46, unit: "g"),
                        PROCNT: Procnt(label: "Proteína", quantity: 6.2, unit: "g"),
                        NA: Na(label: "Sódio", quantity: 10.80, unit: "mg"),
                        FIBTG: Fibtg(label: "Fibra Alimentar", quantity: 3.7, unit: "g")
                     )
        ),
        EdamamRecipe(label: "Espaguete à Carbonara",
                     ingredients: [EdamamIngredient.init(text: "50 gramas de Pecorino Romano (1,8 onças) ralado", quantity: 50, measure: "gramas"),
                                   EdamamIngredient.init(text: "1 ovo grande", quantity: 1, measure: "ovo"),
                                   EdamamIngredient.init(text: "2 colheres de sopa de azeite de oliva", quantity: 2, measure: "colheres de sopa"),
                                   EdamamIngredient.init(text: "pimenta-do-reino moída na hora a gosto", quantity: 0, measure: "a gosto"),
                                   EdamamIngredient.init(text: "170 gramas de Guanciale (6 o…ou Bacon também funciona", quantity: 170, measure: "gramas"),
                                   EdamamIngredient.init(text: "170 gramas de massa seca (6…g ao gosto do pacote", quantity: 170, measure: "gramas"),
                                   EdamamIngredient.init(text: "2 ovos cozidos lentamente (opcional)", quantity: 2, measure: "ovos")],
                     url: "https://www.tudogostoso.com.br/receita/12345-espaguete-a-carbonara.html",
                     image: "https://edamam-product-images.s3.amazonaws.com/web-img/cee/ceee4e5325746adeac6b21e15a675ea8.jpeg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDiTB%2Fl5mMAEH4UnBH%2BVR4vaL21ra4zqr9KZw6xAs41iAIhAJRHgb%2FllUUS7GsFd4b5O3DyFWAFO2qS1h6V1STNdKXFKsEFCOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2IgxIcFnQ3xdOrtCmZEYqlQUrJLjtbbbslkk9tYapdo8PxG%2BJSl7uIFbfyi%2FWtcvQLoWGaFdB8zjntXnXwuiQzSB4tFGfUS2gC5jiWCzfjSqX7lgh5Qmrd4iZ1MZBvUpi7MiWN%2Bb8xjbbTsHCRuPpnwKuLrAvyCuNuZDW3mQsjR7QNFx2l30KBn6qbz8EPa2rkLJjwjTEKIiiXpxIRf9o6vPPrrive7GdbBo%2BW1Dc9bBgzXytyLGhKQrX3NEe0lEQgvaJpM1QShoMDxDD4ntbMQzMkcAPRb9vyvGBRDsbT4gFv3fZtMjCYJm3iNgsY31%2BT4JBszqrOZ04Y8CocCKJAQ9ziiOI5NUK2OB0d2XIXfplc9CQMc1eg7lWbZsV6f%2FtVeyC%2B3fnaudWorSPjViwwIcIzqCHYQ48LJrAUpe3NqoXVn97lAuwNvK9dlX0DlbUpFDqGTGO%2FaivecIeX2T7tz2HwgR7IvkuCa8BsPG611LevmtvhRKr4hiMU9tFAnDqBktX4EbVvit37GTTjjU%2BxIcUq8APRN2v9ndY0dXkx1QilOsGEuaOJch4s3U2d5lhgeayZTmCQWZY6NXkvcre6qSNg49IX7BpKItZzifG%2FsTbBRBNThnHPOe2A%2FGjjGauZuFbk3zAtYxdFgbRyQNy7XwnaN%2FtXsqPhzX4CfzIeQgqFIuqFG8ZanezyrJ0KVM0ITuJi%2FU1EGcIU49yv%2FEOk25aE7tH2KIvOiMSHk0sBohm4J3I9lihoEHvDEpf2sReEpJ84mScHWsFgqd2Y6Xy31WR4jUjctLUJpWY%2FkcKYkxFcBqOUz%2Fs%2BFouE7nrwwUmvJQ9hewB0FWChZ%2Fj4qlhogvIYL%2F0%2BJHcE4uskUegoboaqxsPt%2BVNHG7VAWGZ0surXWSyS2naMK7etaoGOrABxS0k9TKprYXAFooFx6dSAzpmPOeQTZMhOgZJkEDckVrRQkUoImHg7W1pykVr1fVg1NNyhCKXiuEezAHhT%2BVXoLtI0xCCVvGj2MOX190izEmUO%2Ft918rPGOoPlUa1AJLiwwFVXwmQmITrGdLs9ghkB8vw8LZBJbVYz7otkShuFbBjMHfmxJadxLDp3pNDQNIVUNMk1DcgGVscmmzON4G8ZdTpoqseH9JKmHiEMJtXacE%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231110T005254Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHCXDCEHP%2F20231110%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2f3a45b7353ba7b2faae3326cf5b8f4afffb34f27a34690104b0d35f45884c06",
                     calories: 680,
                     totalTime: 30,
                     totalNutrients: TotalNutrients(
                        ENERC_KCAL: Enerc_Kcal(label: "Energia", quantity: 680, unit: "kcal"),
                        FASAT: Fasat(label: "Gordura Saturada", quantity: 12, unit: "g"),
                        FATRN: Fatrn(label: "Gordura Trans", quantity: 0.2, unit: "g"),
                        CHOCDF: Chocdf(label: "Carboidratos", quantity: 60, unit: "g"),
                        PROCNT: Procnt(label: "Proteína", quantity: 15.5, unit: "g"),
                        NA: Na(label: "Sódio", quantity: 500, unit: "mg"),
                        FIBTG: Fibtg(label: "Fibra Alimentar", quantity: 4, unit: "g")
                     )
        ),
        EdamamRecipe(label: "Salada de Legumes",
                     ingredients: [EdamamIngredient.init(text: "2 cenouras médias", quantity: 2, measure: "unidades"),
                                   EdamamIngredient.init(text: "1 pepino grande", quantity: 1, measure: "unidade"),
                                   EdamamIngredient.init(text: "2 tomates médios", quantity: 2, measure: "unidades"),
                                   EdamamIngredient.init(text: "1/2 cebola roxa", quantity: 0.5, measure: "unidade"),
                                   EdamamIngredient.init(text: "100g de queijo feta", quantity: 100, measure: "gramas"),
                                   EdamamIngredient.init(text: "Azeite de oliva a gosto", quantity: 0, measure: "a gosto"),
                                   EdamamIngredient.init(text: "Sal e pimenta a gosto", quantity: 0, measure: "a gosto")],
                     url: "https://www.tudogostoso.com.br/receita/54321-salada-de-legumes.html",
                     image: "https://edamam-product-images.s3.amazonaws.com/web-img/865/8659574d80cda2e6cac2d136674f3b60.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGqyWdQfFWftHOkzah6EnyWOO4NwhAFzU4k3zl5WqiRuAiAd0qEDReQydq4Hfutt8%2FeoKBKdAJSJUOc9fpxhU30wOCrCBQji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIMYD8DqvXJyWg5FnubKpYFfhKT6agOj%2BTuckLClaahVz2oAowwxPA3y%2B%2FCU92bU0tQB6zL%2Bk%2B0ZjlFbRqK1wiVQb8Er%2F7U9eeP4d3ZddH1Voad9i6%2FStc1jZdTUTqWR7Rw8EJ%2BjewpFRbGibtMiuPaqijwanDU6XemD1ekkmvAACDXVO9wl%2BEZ3Pv4tPXSTlG41%2BExHVUEO6hgpUqTzKA2QZm9Q%2FiWYGt8XuCTGjeQnuRc7pdCboxUR4RED7TJTvwI7M6Ld3PB3UIDnOJcQgWLW1I1hmIxhUe%2Bi7vHNeQ1x51zQuB7YEA9m0mGwbAaUI3MTm5%2B8IJr57QTq%2F860ZF2t4hN7Odc4f%2BglVVTODxEe5Jy%2BL5e0lnjcqbjTAxe5IdHsveCwZ0qZJXYBiTztawT7Q3m%2B8nIFxW%2FPt5%2FFkyR3U4p4esX0QVtsi94ik2nSBD%2BCBsFwcuZ8wp1aFazWT1XoOHzGnK5LNprqEyzurCVHh%2FOO3eSE1ehbcC7h8sJi078fDoRv5y%2BrAWv%2FUTOQJVXO8JQhvs%2BTFe8NMA4yS8wC26lU%2FJbjKElO1GjTnbzDXlyyTI%2FkhbJ32Ox66UvpvK1P0qR1%2BZIJwDqp7Owk6u0pLkq%2Fli9gufLM71sLNeNkJhDEcuurGBhRKQAqGAh%2FwfMld1dgifp8F3rwLzeiJ2tYTgLR2a7I5jNMV2qtsPKPU8kRmVtzFH1l0eRlcvdZ8JQYTFE9rbbLeJM9lJ2eNjCsIPa2OnRrAh%2BlIXmoPxEUBn95G0XFRohqzMSUvW38kxtBO9Zzk8YKJ59mJvVqiHFCNyJlOdYXr%2Fe4aDAL1o9k30h5bSLqCq9xDuAh%2FN3IIvMNEMsUwxodwn1AO99Dh%2Fa3Jp24aQ%2Fu1g4QiSK04I7xWXeD%2BiKkMAwsfm1qgY6sgEsT6oakYK2mwyHOd3Gx4lpf%2B1wgn0Xx5IP8zadv3Kpw0OO0RY9l9iTpmheLaQNcwKXF5PYfrGskSq1u3nPeoZEGJcDWSzVOZv%2FrkArMeLU%2F1g9vNakvjNptooQfZi4bCm%2BJRg5QzvkUCX5K%2BJpQ3fo8UPFaBFpJTp8TXjDCbz3Ju46ZOfFScuWMZ24kfPjlrqKIkCSRoPyfm1bUVNDP1QXbA5ybGCjeLgFU62sQHmdrakZ&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231110T012435Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFGLJH6WHA%2F20231110%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e20845e834b21d55537f0a1b34b6e175c61c9e344f01efa8db0de4efc4189692",
                     calories: 210,
                     totalTime: 15,
                     totalNutrients: TotalNutrients(
                        ENERC_KCAL: Enerc_Kcal(label: "Energia", quantity: 210, unit: "kcal"),
                        FASAT: Fasat(label: "Gordura Saturada", quantity: 5, unit: "g"),
                        FATRN: Fatrn(label: "Gordura Trans", quantity: 0.1, unit: "g"),
                        CHOCDF: Chocdf(label: "Carboidratos", quantity: 15, unit: "g"),
                        PROCNT: Procnt(label: "Proteína", quantity: 7, unit: "g"),
                        NA: Na(label: "Sódio", quantity: 200, unit: "mg"),
                        FIBTG: Fibtg(label: "Fibra Alimentar", quantity: 25.6, unit: "g")
                     )
        )
    ]

  
    
    var body: some View {
        ZStack{
            ScrollView {
                VStack {
                    HStack{
                        TextField( "Pesquise qualquer receita",text: $searchText) {
                            // Called when the user tap the return button
                            // see `onCommit` on TextField initializer.
                            UIApplication.shared.endEditing()
                        }.multilineTextAlignment(.center)
                            .font(.title3)
                            .padding(.horizontal,10)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 10)
                            .padding(.top,10)
                        Button(
                            action: {
                                isButton = true
                            }, label: {
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                }.padding()
                                    .foregroundColor(.white)
                                    .background(.yellow)
                                    .cornerRadius(10)
                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10))
                            }).navigationDestination(isPresented: $isButton){
                                RecipeSearchView(queryFromHome: searchText)
                                Text("").hidden()
                            }
                    }
                    
                    NavigationView {
                        List {
                            ImageSlider()
                                .frame(height: 200)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }.scrollContentBackground(.hidden)
                        
                    }.padding(.top, -1)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: -350, trailing: 0))
                    
                    
                    Text("Bem-vindo")
                    Text("Isso foi o que você viu recentemente")
                    Text("")
                    
                    ForEach(predefinedRecipes, id: \.label) { recipe in
                        NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                            HStack {
                                AsyncImage(url: URL(string: recipe.image))
                                    .scaledToFit()
                                    .frame(width: 220, height: 120)
                                    .scaleEffect(0.45)
                                
                                Spacer()
                                
                                VStack {
                                    Text(recipe.label)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Text(String(format: "%.2f Minutos", recipe.totalTime))                                        .foregroundColor(.black)
                                    Text(String(format: "%.2f Kcal", recipe.calories))                                        .foregroundColor(.black)
                                }
                                .padding(.trailing, 30)
                            }
                            .padding(.bottom, 20)
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

