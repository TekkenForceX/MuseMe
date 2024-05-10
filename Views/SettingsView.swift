//
//  SettingsView.swift
//  MuseMe
//
//  Created by Angelo Brown on 4/29/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    var body: some View {
        List {
            if !isLoggedIn {
                Button("Login") {
                    // Perform login action
                    print("User logs in")
                    isLoggedIn = true
                }
            }

            if isLoggedIn {
                Button("Logout") {
                    // Perform logout action
                    print("User logs out")
                    isLoggedIn = false
                }
            }

            NavigationLink(destination: AccountSettingsView()) {
                Text("Account Settings")
            }
            NavigationLink(destination: PreferencesView()) {
                Text("Preferences")
            }
            NavigationLink(destination: NotificationsView()) {
                Text("Notifications")
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}
