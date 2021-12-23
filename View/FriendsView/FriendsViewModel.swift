//
//  FriendsAPI.swift
//  VKClientSwiftUI
//
//  Created by Alex on 14.12.2021.
//

import SwiftUI

class FriendViewModel: ObservableObject {
    
    @Published var friends: [ItemFriends] = []
    let api: GetFriends
    
    init(_ api: GetFriends) {
        self.api = api
    }
    
    public func fetch() {
        api.getFriends { [weak self] friends in
            guard let self = self else { return }
            self.friends = friends.response.items
        }
    }
}
