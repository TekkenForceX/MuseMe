//
//  FaceBoard.swift
//  MuseMe
//
//  Created by Matthew Fails on 5/6/24.
//

import SwiftUI
//import StreamVideo
//import StreamVideoSwiftUI

@main
struct FaceBoardApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                FreeFormDrawingView()
            }
        }
    }
}
