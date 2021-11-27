//
//  ContentView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 27.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var login: String = ""
    @State private var password: String = ""
    var body: some View {
        ScrollView {
        VStack{
            Image("icons8-вконтакте-128")
                .frame(width: 120, height: 120, alignment: .center)
                .padding(.top, 150 )
            
            VStack(alignment: .trailing){
                HStack{
                    Text ("Login")
                    TextField("Login", text: $login).frame(width: 200, height: 20)
                }
                HStack{
                    Text ("Password")
                    TextField("Password", text: $password).frame(width: 200, height: 20)
                }
            }
            Spacer()
        }
        
    }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
