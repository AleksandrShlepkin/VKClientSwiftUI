//
//  FriendsPage.swift
//  VKClientSwiftUI
//
//  Created by Alex on 14.12.2021.
//

import SwiftUI
import Kingfisher


struct FriendsPage: View {
    var friend: ItemFriends
    var body: some View {
        VStack{
            VStack {
                AvatarImage{ KFImage(URL(string: friend.photo100)!)}
                Spacer()
                Text("\(friend.firstName)")
                LikeButton()

                Spacer()
            }
        }
    }
}
