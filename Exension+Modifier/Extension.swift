//
//  Extention.swift
//  VKClientSwiftUI
//
//  Created by Alex on 28.11.2021.
//

import SwiftUI

extension Color {
    public static var lightBlue: Color {
        return Color(red: 0.33, green: 0.55, blue: 1.0)
    }
}


extension View {
    func buttomStyle() -> some View {
        self.modifier(ButtomStyle())
    }
    
    func imageStyle() -> some View {
        self.modifier(ImageStyle())
    }
}
