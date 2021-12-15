//
//  FriendsPage.swift
//  VKClientSwiftUI
//
//  Created by Alex on 14.12.2021.
//

import SwiftUI


struct FriendsPage: View {
    var friend: ItemFriends
    var body: some View {
        TabView {
            VStack {
                Text("\(friend.firstName)")
            }
        }
    }
}
