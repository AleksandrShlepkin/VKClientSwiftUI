//
//  Extention.swift
//  VKClientSwiftUI
//
//  Created by Alex on 28.11.2021.
//

import SwiftUI

extension Color {
    static let shadowDarkSideBlue = Color(red: 0.22, green: 0.44, blue: 1.0)
    static let shadowLightSideBlue = Color(red: 0.55, green: 0.88, blue: 1.0)
    static let darkBlue = Color(red: 0.33, green: 0.55, blue: 1.0)
    static let midleBlue = Color(red: 0.3390, green: 0.5600, blue: 1.0)
    static let lightBlue = Color(red: 0.3451, green: 0.5702, blue: 1.0)
    
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}


extension View {
    func buttomStyle() -> some View {
        self.modifier(ButtomStyle())
    }
    
    func avatarStyle() -> some View {
        self.modifier(AvatarStyle())
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
