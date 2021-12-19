//
//  FriendsViewCollection.swift
//  VKClientSwiftUI
//
//  Created by Alex on 07.12.2021.
//

import SwiftUI
import Kingfisher

struct FriendsViewCollection: View {
    var friend: ItemFriends
    
    var body: some View {
        VStack {
            HStack {
                AvatarImage { KFImage(URL(string: friend.photo100)!)}
                Text("\(friend.firstName) \(friend.lastName ?? "")")
                Spacer()
            }
        }
    }
}

