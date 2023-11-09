
import SwiftUI

struct card: View {
    
    var image:String
    var nameRecipe:String
    var time:String
    var calories:String
    
    var body: some View {
        HStack { // colocar em um for each
            Image(image).scaledToFit().frame(width: 220, height: 120).scaleEffect(0.25)
            Spacer()
            VStack{
                Text(nameRecipe)
                Text(time)
                Text(calories)
            }.padding(.trailing, 30)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        card(image: "lasanha", nameRecipe: "Receita top", time: "15 minutos", calories: "3000")
    }
}
