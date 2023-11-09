//
//  adicionarItemSheet.swift
//  FoodApp
//
//  Created by Student_02 on 09/11/23.
//

import SwiftUI

struct adicionarItemSheet: View {
    
    @State var item: String = ""
    @State var quantidade: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var API = MVShopList()
    
    func editar(){
        var nova: Compras = Compras(name: item, quantity: Int(quantidade), isChecked: false)
        User.usuario.compras.append(nova)
        API.editUser(obj: User.usuario)
    }
    
    var body: some View {
        ZStack{
            VStack{
                Text("Item")
                TextField("Adicione o item", text: $item).font(.title3).padding(.horizontal,30)
                    .textFieldStyle(.roundedBorder)
                Text("Quantidade")
                TextField("Adicione a quantidade", text: $quantidade).font(.title3).padding(.horizontal,30)
                    .textFieldStyle(.roundedBorder)
                Button("Adicionar"){
                    print("adicionado")
                    editar()
                    dismiss()
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct adicionarItemSheet_Previews: PreviewProvider {
    static var previews: some View {
        adicionarItemSheet()
    }
}
