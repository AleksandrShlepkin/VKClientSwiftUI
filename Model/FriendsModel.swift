//
//  FriendsModel.swift
//  VKClientSwiftUI
//
//  Created by Alex on 08.12.2021.
//

import Foundation

protocol FriendsVewInput {
   func getFriends() -> [FriendsTest]
}

class FriendsTest: Identifiable, FriendsVewInput {
    var friends: [FriendsTest] = []
    let biba = FriendsTest(id: 1 , name: "Биба", secondName: "Анатольевич", avatar: "биба")
    let boba = FriendsTest(id: 2, name: "Боба", secondName: "Владимирович", avatar: "боба")
    let pupa = FriendsTest(id: 3, name: "Пупа", secondName: "Петрович", avatar: "пупа")
    let lupa = FriendsTest(id: 4, name: "Лупа", secondName: "Ахмедович", avatar: "лупа")
    
    func getFriends() -> [FriendsTest] {
        friends.append(contentsOf: [biba, boba, pupa, lupa])
        return friends
    }
    
    var id: Int
    var name: String
    var secondName: String
    var avatar: String
    
    init(id: Int, name: String, secondName: String, avatar: String) {
        self.id = id
        self.name = name
        self.secondName = secondName
        self.avatar = avatar
    }
}
