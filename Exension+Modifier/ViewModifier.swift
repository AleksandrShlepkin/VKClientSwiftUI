//
//  ViewModifier.swift
//  VKClientSwiftUI
//
//  Created by Alex on 04.12.2021.
//

import SwiftUI


struct ButtomStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 260)
            .padding(10)
            .background(Color.lightBlue).clipShape(Capsule())
    }
    
}

struct ImageStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .clipped()
            .clipShape(Circle())
            .frame(width: 80, height: 80)
            
    }
}




