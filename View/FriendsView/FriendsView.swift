//
//  SwiftUIView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 05.12.2021.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject var friends: FriendViewModel
    init(friends: FriendViewModel){
        self.friends = friends
    }
    

    var body: some View {
            List(friends.friends){ friend in
                NavigationLink(
                    destination: FriendsPage(friend: friend)) {
                    FriendsViewCollection(friend: friend)
                }
            }
            .onAppear { friends.fetch() }
            .padding(50)
    }
}

//struct FriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView(friends: )
//    }
//}

