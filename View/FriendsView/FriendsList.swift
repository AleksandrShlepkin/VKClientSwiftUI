//
//  FriendsViewCollection.swift
//  VKClientSwiftUI
//
//  Created by Alex on 07.12.2021.
//

import SwiftUI

struct FriendsViewCollection: View {
    var friend: ItemFriends
    
    var body: some View {
        TabView {
            VStack {
                Text("\(friend.firstName) \(friend.lastName ?? "")")
                Spacer()
            }
        }.frame(height: 100)
        
    }
}

