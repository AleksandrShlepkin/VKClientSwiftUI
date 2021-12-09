//
//  SwiftUIView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 05.12.2021.
//

import SwiftUI

struct Friends: Identifiable {
    var id: UUID = UUID()
    var name: String
    var secondName: String
    var avatar: String
}

struct FriendsView: View {
    
    var firends: [Friends] = [
        Friends(name: "Биба", secondName: "Петрович", avatar: "биба"),
        Friends(name: "Боба", secondName: "Алексеевич", avatar: "боба"),
        Friends(name: "Пупа", secondName: "Владимирович", avatar: "пупа"),
        Friends(name: "Лупа", secondName: "Олегович", avatar: "лупа")
        
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(firends, id: \.id) { friend in
                    NavigationLink(destination: FriendsViewCollection()) {
                        VStack(alignment: .leading) {
                            HStack( spacing: 5) {
                                
                                Image(friend.avatar)
                                    .resizable()
                                    .avatarStyle()
                                    .padding(5)
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 20) {
                                    
                                    HStack {
                                        
                                    Text(friend.name)
                                        .foregroundColor(.black)
                                    Text(friend.secondName)
                                        .foregroundColor(.black)
                                        Spacer()
                                    }
                                    
                                    Button(action:{ } ) {
                                        Text("Добавить")
                                            .padding()
                                    }
                                    .buttonStyle(ButtonStyleAddFriends())
                                }
                            }
                        }
                    }
                }
            }.navigationTitle(Text("Друзья"))
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

