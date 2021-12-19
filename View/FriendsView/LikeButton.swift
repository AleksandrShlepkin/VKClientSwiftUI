//
//  LikeButton.swift
//  VKClientSwiftUI
//
//  Created by Alex on 18.12.2021.
//

import Foundation
import SwiftUI

struct LikeButton : View {
    @State private var isLiked = false
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "heart.fill")
                    .opacity(isLiked ? 1 : 0.0)
                    .scaleEffect(isLiked ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 0.15))
                Image(systemName: "heart")
            }.foregroundColor(isLiked ? .red : .gray)
        
                .id(UUID())
        }
        .font(.system(size: 48))
        .onTapGesture {
            isLiked.toggle()
            
        }
    }
}
