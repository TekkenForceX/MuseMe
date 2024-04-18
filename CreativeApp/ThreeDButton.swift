//
//  ThreeDButton.swift
//  MuseMe
//
//  Created by Matthew Fails on 4/16/24.
//

import SwiftUI

struct ThreeD: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            
            let offset: CGFloat = 5
            
            RoundedRectangle(cornerRadius: 9)
                .foregroundColor(.cyan)
                .offset(y: 5)
            
            RoundedRectangle(cornerRadius: 9)
                .foregroundColor(.blue)
                .offset(y: configuration.isPressed ? 5 : 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? 5 : 0)

        }
        .compositingGroup()
        .shadow(radius: 6, y: 4)
    }
}


struct ThreeDButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button") {
            
        }
        .foregroundColor(.white)
        .frame(width: 100, height: 30)
        .buttonStyle(ThreeD())
    }
}

