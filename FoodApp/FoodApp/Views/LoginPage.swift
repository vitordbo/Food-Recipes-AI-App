import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isButton = false
    
    var body: some View {
            ZStack{
                Color(.red).opacity(0.7).ignoresSafeArea()
                VStack{
                    Image("Image").resizable().frame(width: 150,height: 150).scaleEffect(1)
                    Text("Login").font(.title).foregroundColor(.white).fontWeight(.bold)
                    
                    TextField("Email", text: $username).font(.title3).padding(.horizontal,30)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Senha", text: $password).font(.title3).padding(.horizontal,30)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
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
