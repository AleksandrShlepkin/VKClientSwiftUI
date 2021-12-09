//
//  FriendsViewCollection.swift
//  VKClientSwiftUI
//
//  Created by Alex on 07.12.2021.
//

import SwiftUI

struct FriendsViewCollection: View {
    var body: some View {
        List() {
            ForEach(0..<8) { _ in
                HStack {
                    ForEach(0..<3) { _ in
                        Image(systemName:"person.3.fill")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
        }
    }
}

struct FriendsViewCollection_Previews: PreviewProvider {
    static var previews: some View {
        FriendsViewCollection()
    }
}
