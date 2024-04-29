//
//  PreferencesView.swift
//  MuseMe
//
//  Created by Angelo Brown on 4/29/24.
//

import SwiftUI

struct PreferencesView: View {
    @AppStorage("darkModeEnabled") private var darkModeEnabled: Bool = false
    @AppStorage("languagePreference") private var languagePreference: String = "English"
    @Environment(\.colorScheme) var systemColorScheme: ColorScheme

    var body: some View {
        Form {
            Section(header: Text("Display Options")) {
                Toggle("Dark Mode", isOn: $darkModeEnabled)
                    .onChange(of: darkModeEnabled) { value in
                        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = value ? .dark : .light
                    }
                Picker("Language", selection: $languagePreference) {
                    Text("English").tag("English")
                    Text("Spanish").tag("Spanish")
                    Text("French").tag("French")
                    Text("German").tag("German")
                    // Add more languages as necessary
                }
            }
            
            Section(header: Text("Other Preferences")) {
                // Other preferences can go here
            }
        }
        .navigationTitle("Preferences")
        .onChange(of: languagePreference) { newValue in
            setAppLanguage(to: newValue)
        }
    }

    private func setAppLanguage(to language: String) {
        // Here, implement language change functionality
        // This could be just updating a localizable string manager or more complex app-wide changes
        print("Language changed to: \(language)")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PreferencesView()
        }
    }
}
