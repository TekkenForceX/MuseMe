//
//  ViewCoordinator.swift
//  MuseMe
//
//  Created by Hassan Alkhafaji on 5/21/24.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private  var isActive = false
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        if isActive {
            ContentView()
                .environmentObject(viewModel)
        } else {
            SplashScreen(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
