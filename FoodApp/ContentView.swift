import SwiftUI

struct ContentView: View {
    @State private var isButton = false
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(.orange).opacity(0.835).ignoresSafeArea()
                VStack{
                    Image("Image").resizable().scaleEffect(0.9)
                    Text("Meu Livro de Receitas Inteligente")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                                            isButton = true
                                        }, label: {
                                            HStack{
                                                Text("Entrar").fontWeight(.bold).font(.title3)
                                            }.padding()
                                                .foregroundColor(.white)
                                                .background(.red)
                                                .cornerRadius(10)
                                                .padding(.top,50)
                                                .padding(.bottom,100)
                                        }).navigationDestination(isPresented: $isButton){
                                            LoginPage()
                                            Text("")
                                                .hidden()
                                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
