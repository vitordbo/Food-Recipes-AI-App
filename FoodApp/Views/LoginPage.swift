import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isButton = false
    @StateObject var API = MVShopList()
    
    var body: some View {
            ZStack{
                Color(.orange).opacity(0.835).ignoresSafeArea()
                VStack{
                    Image("Image").resizable().frame(width: 150,height: 150).scaleEffect(2).padding(.bottom,70);                    Text("Login").font(.title).foregroundColor(.white).fontWeight(.bold)
                    
                    TextField("Email", text: $username).font(.title3).padding(.horizontal,30)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Senha", text: $password).font(.title3).padding(.horizontal,30)
                        .textFieldStyle(.roundedBorder)
                    
                    // gabriel disse que ficava melhor com um navigation link
                    Button(action: {
                        API.fetch(email: username)
                        isButton = true
                    }, label: {
                        HStack{
                            Text("Entrar").fontWeight(.bold).font(.title3)
                        }.padding()
                            .foregroundColor(.white)
                            .background(.yellow)
                            .cornerRadius(10)
                            .padding(.top,10)
                    }).navigationDestination(isPresented: $isButton){
                        TabViewHome()
                        Text("")
                            .hidden()
                    }
                }
            }
        }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
