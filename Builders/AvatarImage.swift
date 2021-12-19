//
//  AvatarImage.swift
//  VKClientSwiftUI
//
//  Created by Alex on 17.12.2021.
//

import SwiftUI
import Kingfisher



struct AvatarImage: View {
    var content: KFImage
    @State  var scaleFactor = 1.0
    
    
    init(@ViewBuilder content: () -> KFImage) {
        self.content = content()
    }
    
    
    var body: some View {
        content
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            .scaleEffect()
            .animation(.spring(response: 0.2, dampingFraction: 0.35, blendDuration: 0.25))
            .onTouchGesture(
                touchBegan: { withAnimation { self.scaleFactor = 1.75 } },
                touchEnd: { _ in withAnimation { self.scaleFactor = 1.0 } }
            )
        
        
    }
}
