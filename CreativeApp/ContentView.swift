//
//  ContentView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var blockOption: DropDownMenuOption? = nil
    @State private var isSettingsViewPresented = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 3)

                // Main content
                VStack {
                    ZStack {
                        Text("What's blocking you?")
                            .font(.system(size: 50)).bold()
                            .foregroundColor(.cyan)
                            .padding(.leading)
                            .offset(x: 3, y: 3)
                        
                        Text("What's blocking you?")
                            .font(.system(size: 50)).bold()
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                    DropdownMenu(
                        selectedOption: $blockOption,
                        placeholder: "Pick a Category",
                        options: DropDownMenuOption.creativeBlockOptions
                    )
                    
                    NavigationLink(destination: ActivitiesView(prompt: blockOption ?? DropDownMenuOption(option: "Lack of inspiration", enumOption: .MuseMe))) {
                        Text("Generate Muse")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Circle().foregroundColor(.cyan).frame(width: 275).opacity(0.9))
                            .shadow(color: .black, radius: 2)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .background(
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 2400)
                        .edgesIgnoringSafeArea(.all)
                )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isSettingsViewPresented = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
            }
            .background(
                NavigationLink(destination: SettingsView(), isActive: $isSettingsViewPresented) { EmptyView() }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().environment(\.locale, Locale(identifier: "zh-Hans"))
    }
}
