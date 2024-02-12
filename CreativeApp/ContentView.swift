//
//  ContentView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var blockOption: DropDownMenuOption? = nil
    @State private var trigger = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Muse Me")
                        .font(.system(size: 80)).bold()
                        .foregroundColor(.cyan)
                        .padding(.leading)
                    DropdownMenu(
                        selectedOption: $blockOption,
                        placeholder: "What is blocking you?",
                        options: DropDownMenuOption.creativeBlockOptions
                    )

                    NavigationLink {
                        ActivitiesView(prompt: blockOption ?? DropDownMenuOption(option: "Lack of inspiration", enumOption: .MuseMe))
                    } label: {
                        ZStack {
                            Circle()
                                .stroke(Color.cyan, lineWidth: 10)
                                .frame(width: 300)
                            Text("Generate Muse")
                                .font(.largeTitle)
                                .frame(width: 200)
                                .foregroundColor(.white)
                                .sensoryFeedback(.success, trigger: trigger)
                        }
                    }
                }
                .background(
                    Image("wavybg")
                        .resizable()  // Make the image resizable
                        .scaledToFill() // Scale the image to fill the view
                        .edgesIgnoringSafeArea(.all) // Let the image extend to the edges of the screen
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().environment(\.locale, Locale(identifier: "zh-Hans"))
    }
}
