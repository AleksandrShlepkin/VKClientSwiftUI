//
//  TableView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 05.12.2021.
//

import SwiftUI

struct TableView: View {
    @State var countTab: Int = 4
    
    var body: some View {
        TabView(selection: $countTab ) {
            Text("Новости").tabItem { Image(systemName: "list.bullet").tag(1) }
            FriendsView().tabItem { Image(systemName: "person.2.fill").tag(2) }
            Text("Группы").tabItem { Image(systemName: "person.3.fill").tag(3) }
            Text("Настройки").tabItem { Image(systemName: "gear").tag(4) }
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TableView()
        }
    }
}
