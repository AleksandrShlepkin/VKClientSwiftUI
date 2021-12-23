//
//  VKWebView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 13.12.2021.
//

import SwiftUI

struct VKWebView: View {
    
    @ObservedObject var session = Session.shared
    var body: some View {
        NavigationView {
            HStack {
                myWebView(logged: WebViewModel(), type: .public, url: "https://vk.com")
                NavigationLink(destination: TableView( tableView: TableViewModel()), isActive: $session.isAvtorisation) {
                    EmptyView()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct VKWebView_Previews: PreviewProvider {
    static var previews: some View {
        VKWebView()
    }
}
