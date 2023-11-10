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
                     image: "https://edamam-product-images.s3.amazonaws.com/web-img/eb6/eb6fa8d30b81ff47a344dadae0bb67b2.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCICAJgxGDJ0GJyKGTnDgwGRPW0tmPwtUFckdGb%2F7FBwupAiEAyXj8QL%2BhUZwbmJdMBs%2F4VC2gjkwMj3aodNGIrmc3xIEqwQUI9%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDHGsGKx2RRbQZI2vWSqVBfLLeCz%2BgaMVSydrpVmZLk2VZS3wsNXstpZTLNV6YeTF1iODwGiq53ahFrIrYaZGOxR%2FY5nuPSsd1kV3qMDT3DW9PmdUWRRW0EIINbJ6qQadnxi%2BOMeygspkWJ1DHuBc1V74R24ZMwh2%2FjmQh76%2F7pTI8a4NouJBn0zAmozTR%2F1kl4C56J87x7u1LcIO9BzwAHFHJHjE9NXhqC9ikDCo9k%2Bb4dNXu70f51zu3%2BcJIEmCrz70XSIzrDLHMEDTSyMpelvHvmmJYo6xANS2AL0SKgtPRyKExVIdo33p%2BM1%2Fhjpps0%2FR1ECmht%2Bi0xhYXMKVv3IEqcXcah4zEmtgVvMDSOaKX6zVr%2F3BZvJ32IWDRPwcfE4MawXfpSreQpPHVBVlBqBgmnN1KZUm5tYUAgr%2Fhpk7V52No9whDounwfONvP6%2F9feNb3u6weD6bQVGYRliKMIKiYvKuIwai9G%2BNCT0mqgNgHlzbEvdANDbH0fbbkaa8hVncFcxOCQusRxeWep%2FwBec%2FguTUaiz3RAiAT9am4xGaaAuN9c22OPRMZ3oRIIal5PZmhgyxdpdYrxmUy61xrROqjJdQ2Bj%2F6k4O0mfORvMutv2lwpx4Gsv%2Fx%2F8qnKEOOrBF6DqdtO4D8yD8Ey%2BoM%2B9%2FXAD3tjsKDajQSPjcgjhT0GECEtqVv9h7Sa0D%2FffE2%2FAiscfWATQ7sYXUVhRi0ftV1vixfmKD4PJAr52PgZpIhwObEW7ATaFJo7oCyLVguCcIzQggaFmuN4yQNUT5fhfUPTztKfxP1Kb3%2BD8V7Dhd6IBk0GFMO0L2WIM13SdbtbhA2%2Bf4jEkeyDE1WwJmfaIF2Xfefdtlx6OstqLnLQG9OQdkpluiqxRZVppiw9eIGpi5UIw1cu6qgY6sQHxSBDGyiaTm5vloINSvtuoQ562T3i3FlctmfHL7ILLE6JC8EG2dBEUOXw5vZtbInkm72RdQ5EGlKbSIOl6Q7SOKMGOqTMvj0aON1fwRZYOoXiehfswzZEUQlc2H66e%2BrRUmkpOVk7X8oVxdLU%2F7aMZoVdpthsniDAdPJ7hcK34TrZB6HgSAVsyi1tXu6c4lRBLhcECTtk%2FDehXltSVkjfQJ86Gj%2BFyxXqM%2BpysYs6XZaU%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231110T223220Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFJQI6H5AK%2F20231110%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=7f0babca304b0fe98736f4067ff5486aaeb50947ec65d23663e369dd53690e3d",
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
                     image: "https://edamam-product-images.s3.amazonaws.com/web-img/066/066b847fe1198582786bd20c83afd030.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGFKJs364SA53qmev%2Bg%2FjCC1o%2FDwIEY3NENyKBbwvyJUAiBzH2chyKGGJVwMmbfeLI3Xqquu8EDOi4GcWOg6O2ZdGCrCBQj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIMp%2BFcNoKvLh4sXxCiKpYFfCCjKrq7TvayvACPCkszyVWN9y77vyj7ZttjaFr1rZqMzTtsvAD%2BUnVX97gY62yMcSWMvD7HWNZMXPYM%2Bq53A1FJxjuFUBaZkB5rqjOCO4Jliz2zc7pVDdMRX%2FSmwIm8ZTbIdcliU7D5USYitN9oKa7OCkfQowHC%2BsylW9XH%2BAA%2BCugbfqKhE6TuFN4xAey9Lw1RBttp7BEa2GfUvoCZ8Uw0E%2B%2F6D0CN2fIQ%2BxecilV2SBPkTMHLGEZf3b1WqvbS18djPI4Tskjua%2F%2FQfvjDNQjmC6bnqELCBdl1i7nd5W%2BDUi5svBxvuLO%2F%2BY2NjuBbEBZ5fQbIZpgf2GftiQzdw3tH%2F3iQtEPWVhqmSUiN7qhlc0rvPAIXI5RJ8vh6Od8679T%2BVcq3vXoz7KrQFtBC3F0D0GvLaA%2BvxQ6qEAlXxubAolHPydntPJDRLrTjUR4SIHneYcDrJb0e8zZgQy2MfAn%2B1ZRE7OD5LXRzBn4ycAS83ZEWpTtHuMMYbUPnwYeS1mdlKaOFRJkGMRKpx5b7nKsI0cOa6f7niiW6SFKYhCD2YMBS%2FIxZ9ZpZM7CIXUDHXUlWDD0BsKqpm%2BKDUoLJwibM2TqU%2BYwO3vMqDp8WDMwD0uUcl8%2FNePXdbRzx6hZjSH0KFPnX2Lapy1sn5JdfPSKpAGTaTV7kts3ZmffWT5Cf8RkX6Kc6D2qM4cZmqE9AXYzlx%2BEM%2BCv1%2BFlqBXKNEEUDvrwtzGvOSut%2FFnE4mSh0lqkmeISM9%2FJ2X1guMogfgZr3GuIe4fSkxtMH%2Bov6ILyOo7LYYF4SH3%2Fg7ezAAM9Tak9RXkxnjvbWlztaZ3dYLX53aZOjMIhbtoD38J9YGPdxG66b9xEE9SDH55NRbXzCP%2FfKEEUwo8W6qgY6sgHXK6ytglqzTGRnld2lsVOR4TELlu0iGsVju2u3XIVQOV0L132kmW9azXembMe9PEoim8E%2B0Xr%2FDkRlShWB15qes2%2BtxHvKSu8STrLZ5HwRGYjShw%2B%2FAGjsG0xixT2H%2BBivNLnOaLkGtIT4eyhrDXGnFZeSuSk51Ioy3UWA%2FWZ0KB0WZFYqs1KbxcaYCgN%2B7Jz9cLTtwy3R5LwAFMxKw%2Bam1LpH2CtQKP7o0vvfDuv7M0J0&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231110T221734Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHZP5QIF6%2F20231110%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=920bb276fe1121586df2557e07f49680caa502e9c51d9cbc055118dff832c99f",
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
                     image: "https://edamam-product-images.s3.amazonaws.com/web-img/865/8659574d80cda2e6cac2d136674f3b60.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCtJtIRaEJrO%2BY9IBVZg3RDiot%2FVLudgDpwzLbSRLQDhQIgT7stTCENHa3so3MPYwGWgME%2B%2BetQ6dfazUyEU8ocDwkqwgUI9v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDN1CmgcrrA2vp5p1xCqWBXTN7JTWF6VM9z1KNkEgJV6ytmiw15WNQV0QJ%2BQHv2CNTfqDzPFEPhmyF3Lxbwyj%2FY0AcwX8GUn7SSKPtoJ88fYKnPJhtc45kRY5rh%2Bz3XtxfFwmaKzOTLcIqT%2FzApx3BNlx4Qkw50OFzD6B1f417%2FKvBqREB0KM3v1TIsuXlXLKJHZlrs1gYfXqy4YPt%2F1l6VH5B41ovs2JIXGAyINufsulSfpVYx06Wzy2beePeromKJlklXBcaPNd7WyNTIPix3%2FCqV2p7DxVHII%2Fi3QhQFOpZAOWdUHBLTjUxHbPB%2BwqrNLfat3sbTi%2FOF4Vxer6UtYkmxVsFKisxc%2BAEdf2ItG3u%2ByQM2LtpXrIZmNB%2BYyunvT%2Fiuyd74nRtGvRsYK71AnV1p5ayTzemOmZJkLC0sI2VHnPIhn%2FBViEhzKBs5wuD77KW%2BESWAgf92BIFEf62a4vxn7i%2BC%2BFfXPwnBp33iKlatRT%2FP%2FqsWxA9GoZjEZ8HpagB5%2FT6YBQ35LVmxLJTiKURA9%2Feo5%2B%2FmcNB4jdxlDj9Jzbc1u5EHo%2Bv%2B9nzwr0cV21MUCHZly3sSDQLhLngKBZdt7tC58CcocQ84RgL9L6scLRztrZ8X3Q4BtXYg5T5u2xYfW8NDI4O03jG8h%2Fs%2FurmnGLuDcslWti0DCQruRBf%2FGHfnDWx%2F8ggoTdXib%2BtBln9mjjeUlBl%2BTuqjel1H8ABRHI%2FHg1TH381sqHWIqzQ%2BcjkWalZCMDlK7893cfni62MSPFfT1Zh5lvS2yoaFBL%2BdjHGPmgdW5yAt0n%2BO7WVbMaHkksiAygiKgLg3FACXJudDpaubg1UVxKZ6r1GFprZkNA%2BcQX8igxzJodieyEuufoMZFyqqzucDWTcfnWajtrSVd0MLOruqoGOrEBDQ9Y4461MzZsT9ZrAnv530m8E4XhiIsme1%2B1Xg1JTkSrLnb5M5nWPJrmOTwwcCy9q1At%2BYrXS4cVZF1J0HCy%2F%2BmC68%2F9nZLcNNjnIUmbA%2FLFSPB90GJSfBljH5yVHOEzgMLm0P%2FTxm5Vi1I4L2X0dyFyp%2BK%2Fj4rueSV%2FpUR7q6GfZYJXDuyWEa%2FOxTPnz7mAlsasYW5MfEXc5fJAywmSHxAbqL%2B81dRtlt5Es4TJEVEP&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231110T221712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=ASIASXCYXIIFHBEZT6NJ%2F20231110%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=34e2018e1419dd1e97c17cb43ad3ecdbd23cce2daa8682f7d8aa0bbb6f421fe7",
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
                    Text("Essas são as receitas em destaque")
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

