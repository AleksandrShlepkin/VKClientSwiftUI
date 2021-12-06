//
//  TransitionView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 04.12.2021.
//

import SwiftUI


struct TransitionView: View {
    
    @State private var showFriendsCellView: Bool = false

    var body: some View {
        NavigationView {
            HStack {
                LoginView(showNextView: $showFriendsCellView)
                NavigationLink(
                    destination: TableView(),
                    isActive: $showFriendsCellView,
                    label: {
                        EmptyView()
                    })
            }
        }     
    }
    
    struct TransitionView_Previews: PreviewProvider {
        static var previews: some View {
            TransitionView()
        }
    }

}
