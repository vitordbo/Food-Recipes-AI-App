//
//  FoodApiService.swift
//  FoodApp
//
//  Created by Student on 06/11/23.
//

import Foundation
import Alamofire
import Combine

class EdamamService {
    let baseURL = "https://api.edamam.com/search"
    let appId = "120bf211" // Replace with your Edamam API app ID
    let appKey = "bd0ba0bc9b65e5e5e5b110a6ce115de3"
    
    func searchRecipe(query: String) -> AnyPublisher<EdamamRecipeResponse, Error> {
        let parameters: Parameters = [
            "q": query,
            "app_id": appId,
            "app_key": appKey
        ]

        return Future { promisse in
            AF.request(self.baseURL, parameters: parameters).responseDecodable(of: EdamamRecipeResponse.self) { response in
                switch response.result {
                case .success(let result):
                    promisse(.success(result))
                    print(result)
                case .failure(let error):
                    promisse(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

struct EdamamRecipeResponse: Decodable {
    let hits: [EdamamRecipeHit]
}

struct EdamamRecipeHit: Decodable {
    let recipe: EdamamRecipe
}

struct EdamamRecipe: Decodable {
    let label: String
    let ingredients: [EdamamIngredient] // Change the type to an array of ingredients
    let url: String
    let image: String
    let calories: Double
    let totalTime: Double
    let totalNutrients: TotalNutrients
}

struct EdamamIngredient: Decodable { // Define a separate ingredient model
    let text: String
    let quantity: Double?
    let measure: String?
}

struct TotalNutrients: Decodable {
    let ENERC_KCAL: Enerc_Kcal
    let FASAT: Fasat
    let FATRN: Fatrn
    let CHOCDF: Chocdf
    let PROCNT: Procnt
    let NA: Na
    let FIBTG: Fibtg
    
}

struct Enerc_Kcal: Decodable{
    let label: String
    let quantity: Double?
    let unit: String
}

// gordura saturada
struct Fasat: Decodable{
    let label: String
    let quantity: Double?
    let unit: String
}

// gordura trans
struct Fatrn: Decodable{
    let label: String
    let quantity: Double?
    let unit: String
}

// fibras
struct Fibtg: Decodable{
    let label: String
    let quantity: Double?
    let unit: String
}

// carbs
struct Chocdf: Decodable{
    let label: String
    let quantity: Double?
    let unit: String
}

// proteinas
struct Procnt: Decodable{
    let label: String
    let quantity: Double?
    let unit: String
}

// sodio
struct Na: Decodable{
    let label: String
    let quantity: Double?
    let unit: String
}





