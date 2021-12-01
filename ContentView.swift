//
//  ContentView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 27.11.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var scale: CGFloat = 50
    @State private var shoudShowLogo: Bool = true
    
    private let keyboard = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    ).removeDuplicates()
    
    var body: some View {
        ZStack {
            Image("lightBlue").resizable()
                .ignoresSafeArea()
                
        VStack {
        ScrollView {
         
            VStack{
                if shoudShowLogo == true {
                Image("VKLog")
                    .padding(.top, 120 )
                    .scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.easeOut(duration: 1.0)
                        return withAnimation(baseAnimation) {
                            self.scale = 1
                        }
                    }
                } else {
                    Image("VKLog")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)

                    
                }
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
                .padding()
            }
            VStack {
                Button(action: { print ("Test")}) {
                    Text("Sing Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 260).padding()}.background(Color.lightBlue).clipShape(Capsule())
                    .padding(.top, 32)
                    .disabled(login.isEmpty || password.isEmpty)
            }
            
            VStack{
                HStack{
                    Button(action: { }) {
                        Text("Don't have account?").foregroundColor(.secondary).padding()
                    }.disabled(true)
                }
            }
            
        }.textFieldStyle(RoundedBorderTextFieldStyle())
        .onReceive(keyboard) { value in
            self.shoudShowLogo = !value
            
        }.onTapGesture {
            self.endEditing()
        }
        
    }
    }
    }
    func endEditing(){
        UIApplication.shared.endEditing()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}



extension UIApplication {
    func endEditing() {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
