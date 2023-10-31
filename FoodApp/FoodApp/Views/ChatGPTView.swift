//
//  ChatGPTView.swift
//  FoodApp
//
//  Created by Student on 30/10/23.
//

import SwiftUI
import Combine

struct ChatGPTView: View {
    @State var chatMessages: [ChatMessage] = []
    @State var messageText: String = ""
    let openAIService = OpenAIService()
    @State var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVStack{
                    ForEach(chatMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack{
                TextField("Digite o que deseja", text: $messageText) {
                    
                }
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button{
                    sendMessage()
                } label: {
                    Text("Enviar")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
    }
    
    // funçao de visualização
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .me {Spacer() }
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white: .black) // ternario chat ou pessoa
                .padding()
                .background(message.sender == .me ? .blue: .gray.opacity(0.1))
                .cornerRadius(16)
            if message.sender == .chat {Spacer() }
        }
    }
    
    func sendMessage() {
        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        chatMessages.append(myMessage)
        openAIService.sendMessage(message: messageText).sink { completion in
            //handle error
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "/"))) else {return }
            let gptMessage =  ChatMessage(id: response.id, content: textResponse, dateCreated: Date(), sender: .chat)
            chatMessages.append(gptMessage)

        }
        .store(in: &cancellables)
        
        messageText = ""
    }
}

struct ChatGPTView_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPTView()
    }
}

struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case chat
}

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Sample message from me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample message from gpt", dateCreated: Date(), sender: .chat),
        ChatMessage(id: UUID().uuidString, content: "Sample message from me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample message from gpt", dateCreated: Date(), sender: .chat),
    ]
}
