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
        ZStack {
            Image("lightBlue").resizable()
                .ignoresSafeArea()
                
        VStack {
        ScrollView {
            VStack{
                Image("icons8-вконтакте-128")
                    .frame(width: 120, height: 120, alignment: .center)
                    .padding(.top, 130 )
                
                VStack(){
                    HStack{
                        Text ("Login")
                        Spacer()
                        TextField("Login", text: $login).frame(width: 150, height: 30)
                    }
                    HStack{
                        Text ("Password")
                        Spacer()
                        TextField("Password", text: $password).frame(width: 150, height: 30)
                    }
                }.frame(maxWidth: 250)
            }
            VStack {
                Button(action: { print ("Test")}) {
                    Text("Sing Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 260).padding()}.background(Color.lightBlue).clipShape(Capsule())
                    .padding(.top, 32)
            }
            
            VStack{
                HStack{
                    Button(action: { }) {
                        Text("Don't have account?").foregroundColor(.secondary).padding()
                    }.disabled(login.isEmpty || password.isEmpty)
                }
            }
            
        }.textFieldStyle(RoundedBorderTextFieldStyle())
            
    }
    }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}



