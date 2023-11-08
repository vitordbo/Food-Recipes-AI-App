//
//  nodeRedApi.swift
//  FoodApp
//
//  Created by Student_02 on 07/11/23.
//

import Foundation

 struct User {
     static var usuario: Pessoa = Pessoa(email: "")
}

struct Pessoa : Decodable, Hashable {
    let email: String?
}

struct Compras : Decodable, Hashable {
    let name: String?
    let quantity: Int?
    let isChecked: Bool?
}

class MVShopList : ObservableObject {
    
    @Published var lista: [Pessoa] = []
    
    func fetch(email: String){
        guard let url = URL(string: "http://127.0.0.1:1880/api/v1/findAll") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Pessoa].self, from: data)
                DispatchQueue.main.async {
                    self?.lista = parsed
                    self?.findUser(email: email)
                    print(parsed)
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
    func findUser(email: String) {
        for pessoa in lista {
            if pessoa.email == email {
                User.usuario = pessoa
                print(User.usuario.email!)
            }
        }
    }
}
