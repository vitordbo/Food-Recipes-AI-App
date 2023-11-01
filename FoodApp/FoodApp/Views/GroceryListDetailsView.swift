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
  var isChecked: Bool = false
}

struct GroceryListDetailsView: View {
    @State var checklistItems = [
      ChecklistItem(name: "Walk the dog"),
      ChecklistItem(name: "Brush my teeth"),
      ChecklistItem(name: "Learn iOS development", isChecked: true),
      ChecklistItem(name: "Soccer practice"),
      ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    var body: some View {
      NavigationView {
        List {
          ForEach(checklistItems) { checklistItem in
            HStack {
              Text(checklistItem.name)
              Spacer()
              Text(checklistItem.isChecked ? "✅" : "🔲")
            }
            .onTapGesture {
              if let matchingIndex = self.checklistItems.firstIndex(where: { $0.id == checklistItem.id }) {
                self.checklistItems[matchingIndex].isChecked.toggle()
              }
            }

          }
          .onDelete(perform: deleteListItem)
          .onMove(perform: moveListItem)
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle("Lista de compras")
      }
    }
    
    // Methods
    // =======

    func deleteListItem(whichElement: IndexSet) {
      checklistItems.remove(atOffsets: whichElement)
    }

    func moveListItem(whichElement: IndexSet, destination: Int) {
      checklistItems.move(fromOffsets: whichElement, toOffset: destination)
    }
}

struct GroceryListDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListDetailsView()
    }
}
