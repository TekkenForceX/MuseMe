//
//  App.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/8/24.
//

import SwiftUI

@main
struct MuseMeApp: App {
    @ObservedObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
