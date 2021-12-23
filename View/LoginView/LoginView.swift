//
//  LoginView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 27.11.2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var login: String = "test"
    @State private var password: String = "test"
    @State private var scale: CGFloat = 1
    @State private var shoudShowLogo: Bool = true
    @State private var invalidPassword: Bool = false
    @ObservedObject var viewModel: LoginViewModel
    
    
    
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
            
            ScrollView {
                
                VStack{
                    if shoudShowLogo {
                        Image("VKLog")
                            .padding(.top, 120)
                            .scaleEffect(scale)
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
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                }
                VStack {
                    Button(action: { correctLogin() }) {
                        Text("Sing Up")
                            
                    }
                    .buttonStyle(ButtonStyleSingUp())
                    .padding(.top, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                    .alert(isPresented: $invalidPassword, content: {
                            Alert(title: Text("Ошибка"), message: Text("Неверный логин/пароль"), dismissButton: .cancel())
                    })
                }
                
                VStack{
                    HStack{
                        Button(action: { }) {
                            Text("Don't have account?")
                                .foregroundColor(.secondary)
                                .padding()
                            
                        }.disabled(true)
                    }
                }
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .onReceive(keyboard) { value in
                self.shoudShowLogo = !value
                    
                
            }.onTapGesture {
                self.endEditing()
            }
            
        }.navigationBarHidden(true)

    }
    
    func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    func correctLogin() {
        if login == "test" && password == "test" {
            self.viewModel.userIsLogged = true
        } else {
            
            self.invalidPassword = true
        }
    }
    
}

extension UIApplication {
    func endEditing() {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

