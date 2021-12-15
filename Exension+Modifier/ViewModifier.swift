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
            .frame(width: 130, height: 40)
            .background(Color.darkBlue).clipShape(Capsule())
    }
    
}

struct AvatarStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .clipped()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
        
    }
}

struct ButtonStyleSingUp: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(Color.darkBlue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12.0)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .blur(radius: 2)
                                    .offset(x: 2, y: 2)
                                    .mask(RoundedRectangle(cornerRadius: 12.0).fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12.0)
                                    .stroke(Color.white, lineWidth: 2)
                                    .blur(radius: 2)
                                    .offset(x: -2, y: -2)
                                    .mask(RoundedRectangle(cornerRadius: 12.0).fill(LinearGradient(Color.clear, Color.black)))
                            )
                    } else {
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(Color.lightBlue)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 10, y: 10)
                            .shadow(color: Color.midleBlue.opacity(0.7), radius: 3, x: -5, y: -5)
                    }
                }
            )
    }
}


struct ButtonStyleAddFriends: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .font(.footnote).foregroundColor(.secondary)
            .frame(width: 120, height: 30)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(Color.darkBlue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12.0)
                                    .stroke(Color.shadowDarkSideBlue, lineWidth: 4)
                                    .blur(radius: 2)
                                    .offset(x: 2, y: 2)
                                    .mask(RoundedRectangle(cornerRadius: 12.0).fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(Color.shadowLightSideBlue, lineWidth: 2)
                                    .blur(radius: 2)
                                    .offset(x: -2, y: -2)
                                    .mask(RoundedRectangle(cornerRadius: 12.0).fill(LinearGradient(Color.clear, Color.black)))
                            )
                    } else {
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(Color.lightBlue)
                            .shadow(color: Color.black.opacity(0.2), radius: 1, x: 5, y: 5)
                            .shadow(color: Color.white.opacity(0.7), radius: 1, x: -3, y: -3)
                    }
                }
            )
    }
}

struct PlainList: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineSpacing(50.0)
    }
}



