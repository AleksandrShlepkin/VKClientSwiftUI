//
//  TableView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 05.12.2021.
//

import SwiftUI
class TableViewModel: ObservableObject {
    @Published var transition = false
}

struct TableView: View {
    @State var countTab: Int = 4
    
    @ObservedObject var tableView: TableViewModel
    
    var body: some View {
        TabView(selection: $countTab ) {
            FriendsView(friends: FriendViewModel(FriendsAPI()))
                .tabItem { Image(systemName: "person.2.fill").tag(1) }
            Text("Новости")
                .tabItem { Image(systemName: "list.bullet").tag(2) }
            Text("Группы")
                .tabItem { Image(systemName: "person.3.fill").tag(3) }
            Text("Настройки")
                .tabItem { Image(systemName: "gear").tag(4) }
        }.navigationBarHidden(true)
    }
}

//struct FriendsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            TableView()
//        }
//    }
//}
