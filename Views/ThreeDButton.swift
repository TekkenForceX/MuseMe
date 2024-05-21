//
//  ThreeDButton.swift
//  MuseMe
//
//  Created by Matthew Fails on 4/16/24.
//

import SwiftUI
//TODO: Complete an animation in here

struct ThreeD: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            
            let _: CGFloat = 5
            
            Image("Button_light")
                .resizable()
                .offset(y: 8)
                .frame(width: 400, height: 400)
            
            Image("Button_light")
                .resizable()
                .offset(y: 5)
                .offset(y: configuration.isPressed ? 10 : 0)
                .frame(width: 400, height: 400)
            
            configuration.label
                .offset(y: configuration.isPressed ? 10 : 0)

        }
        .compositingGroup()
        .shadow(radius: 6, y: 4)
    }
}


struct ThreeDButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("") {
            
        }
        
        .background(
            Image("background")
                .resizable()  // Make the image resizable
                .scaledToFill() // Scale the image to fill the view
            // Added frame and changed width to make the app fit
            .frame(width: .infinity, height: 880)
               .edgesIgnoringSafeArea(.all) // Let the image extend to the edges of the screen
                //.blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        )
        .foregroundColor(.white)
        .frame(width: 1000, height: 200)
        .buttonStyle(ThreeD())
    }
}
