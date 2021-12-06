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
                    VStack(alignment: .leading) {
                        VStack( spacing: 10) {
                            
                            Image(friend.avatar)
                                .resizable()
                                .imageStyle()
                                .padding(10)
                            
                            VStack( spacing: 5) {
                                
                                Text(friend.name) + Text(" ") + Text(friend.secondName)
                                
                                Button(action:{ } ) {
                                    Text("Добавить")
                                        .buttomStyle()
                                        .frame(width: 20, height: 20)
                                        .padding(30)
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

