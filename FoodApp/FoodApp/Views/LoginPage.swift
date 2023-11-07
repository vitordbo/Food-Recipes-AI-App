import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isButton = false
    
    var body: some View {
            ZStack{
                Color(.red).opacity(0.7).ignoresSafeArea(.all)
                VStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 150,height: 150)
                        .scaleEffect(1)
                    
                    Text("Login").font(.title).foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    TextField("Email", text: $username).font(.title3)
                        .padding(.horizontal,30)
                        .textFieldStyle(.roundedBorder)
                        .frame(height: 10)
                        
                    
                    SecureField("Senha", text: $password)
                        .font(.title3)
                        .padding(.horizontal,30)
                        .textFieldStyle(.roundedBorder)
                        .frame(height: 10)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    Button(
                        action: {
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
                                            Text("").hidden()
                                        }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
