//
//  LoginView.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/3/24.
//

import SwiftUI

struct LoginView: View {
    @State private var isUserAuthenticated = false
    
    var body: some View {
        VStack {
            if isUserAuthenticated {
                Text("Welcome to the app!")
                // Your app's main content
            } else {
                Text("You need to log into iCloud to use this app.")
                Button("Open Settings", action: openSettings)
            }
        }
        .onAppear {
            AuthenticationManager().checkiCloudStatus { authenticated in
                isUserAuthenticated = authenticated
            }
        }
    }
    
    private func openSettings() {
        if let url = URL(string: "App-Prefs:root=Settings") {
            UIApplication.shared.open(url)
        }
    }
}
