//
//  SplashScreen.swift
//  MuseMe
//
//  Created by Hassan Alkhafaji on 5/20/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color("darkB")
                .ignoresSafeArea()
           Image("logo")
                .resizable()
            
                
        }
    }
}

#Preview {
    SplashScreen()
}
