//
//  Session.swift
//  VKClientSwiftUI
//
//  Created by Alex on 13.12.2021.
//

import Foundation

class Session: ObservableObject {
    
    static var shared = Session()
    private init (){}
    
    @Published var isAvtorisation: Bool = false
    @Published var token = ""
    @Published var userID = "alexandr_gennadevich"
    @Published var clientID: Int = 0
}
