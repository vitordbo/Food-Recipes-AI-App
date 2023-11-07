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
}

struct EdamamIngredient: Decodable { // Define a separate ingredient model
    let text: String
    let quantity: Double?
    let measure: String?
    // Add other properties as needed
}
