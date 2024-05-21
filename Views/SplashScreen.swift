//
//  SplashScreen.swift
//  MuseMe
//
//  Created by Hassan Alkhafaji on 5/20/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @Binding var isActive: Bool
    @State private var size = 0.5
    @State private var opacity = 0.4
    
    
    var body: some View {
      
            ZStack {
                Color("buttonbg")
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 400, height: 100)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            size = 0.9
                            opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            isActive = true
                        }
                    }
                }
                
                    
            }
        
        
    }
}

#Preview {
    SplashScreen(isActive: .constant(false) )
}
