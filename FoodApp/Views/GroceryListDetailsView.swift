
//
//  GroceryListView.swift
//  FoodApp
//
//  Created by Student on 31/10/23.
//

import SwiftUI

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var quantidade: Int
    var isChecked: Bool = false
}

struct GroceryListDetailsView: View {
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", quantidade: 10),
        ChecklistItem(name: "Brush my teeth", quantidade: 15),
        ChecklistItem(name: "Learn iOS development", quantidade: 2, isChecked: true),
        ChecklistItem(name: "Soccer practice", quantidade: 4),
        ChecklistItem(name: "Eat ice cream", quantidade: 55, isChecked: true),
    ]
    //   @StateObject var x : MVShopList
    @State var usuario: Pessoa? = nil
    
    
     func deleteListItem(whichElement: IndexSet) {
        self.usuario?.compras.remove(atOffsets: whichElement)
        }
    
     func moveListItem(whichElement: IndexSet, destination: Int) {
        self.usuario?.compras.move(fromOffsets: whichElement, toOffset: destination)
        }
    
    var body: some View {
        NavigationView{
            VStack{
                if(usuario != nil){
                    List {
                        ForEach(self.usuario!.compras, id: \.name) { checklistItem in
                            HStack {
                                Text(checklistItem.name!).foregroundColor(.cyan)
                                Text("\(checklistItem.quantity!)")
                                Spacer()
                                Text(checklistItem.isChecked! ? "✅" : "🔲")
                            }
                            .onTapGesture {
                                if let matchingIndex = self.usuario!.compras.firstIndex(where: { $0.name == checklistItem.name }) {
                                    self.usuario?.compras[matchingIndex].isChecked!.toggle()
                                }
                            }
                        }
                        .onDelete(perform: self.deleteListItem)
                        .onMove(perform: self.moveListItem)
                    }
                    .navigationBarItems(trailing: HStack{
                        EditButton()
                    })
                    .navigationBarTitle("Lista de compras")
                }
            }.onAppear(){
                
                print(User.usuario)
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ a in
                    self.usuario = (User.usuario)
                    a.invalidate()
                }
            }
        }
    }
}


struct GroceryListDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListDetailsView()
    }
}

