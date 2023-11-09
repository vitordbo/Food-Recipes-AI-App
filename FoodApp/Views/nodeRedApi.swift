
import Foundation

 struct User {
     static var usuario: Pessoa = Pessoa(_id: "", _rev: "", email: "", compras: [Compras(name: "", quantity: 0, isChecked: false)])
}

struct Pessoa : Decodable, Encodable {
    var _id: String?
    var _rev: String?
    var email: String?
    var compras: [Compras]
}

extension Pessoa : Identifiable{
    public var id : String{
        _id!
    }
}

struct Compras : Decodable, Encodable {
    var name: String?
    var quantity: Int?
    var isChecked: Bool?
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
    
    func editUser(obj: Pessoa){
        
            guard let url = URL(string: "http://127.0.0.1:1880/api/v1/compras/editar") else { return }
                
                var request = URLRequest(url: url)
                request.httpMethod = "PUT"
                
                do {
                    let data = try JSONEncoder().encode(obj)
                    
                    print(data)
                    
                    request.httpBody = data
                } catch {
                    print("Error encoding to JSON: \(error.localizedDescription)")
                }
            
                
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error deleting resource: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        print("Error deleting resource: invalid response")
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        print("Resource deleted successfully")
                    } else {
                        print("Error deleting resource: status code \(httpResponse.statusCode)")
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
