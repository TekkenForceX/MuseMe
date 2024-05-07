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

                    NavigationLink {
                        ActivitiesView(prompt: blockOption ?? DropDownMenuOption(option: "Lack of inspiration", enumOption: .MuseMe))
                    } label: {
                        
                        Button("") {
                            
                        }
                        
                        .foregroundColor(.white)
                        .frame(width: 200, height: 500)
                        .buttonStyle(ThreeD())
                        .disabled(true)
                        .offset(y: 10)

//                        ZStack {
//                            Circle()
//                                .frame(width: 275)
//                                .foregroundColor(.cyan)
//                                .opacity(0.9)
//                                .shadow(color: .black, radius: 2)
//                            
//                            Circle()
//                                .stroke(.cyan, lineWidth: 10)
//                                .shadow(color: .black, radius: 50)
//                                .frame(width: 275)
//                            Circle()
//                                .stroke(.babyGreen, lineWidth: 1)
//                                .shadow(color: .black, radius: 50)
//                                .frame(width: 285)
//                            
//                            Text("Generate Muse")
//                                .font(.largeTitle.bold())
//                                .shadow(color: .black, radius: 1)
//                                .frame(width: 200)
//                                .foregroundColor(.white)
//                                .sensoryFeedback(.success, trigger: trigger)
//                        }
                    }
                }


                .background(
                    Image("background")
                        .resizable()  // Make the image resizable
                        .scaledToFill() // Scale the image to fill the view
                    // Added frame and changed width to make the app fit
                        .frame(width: .infinity, height: 2400)
                        .edgesIgnoringSafeArea(.all) // Let the image extend to the edges of the screen
//                        .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                )

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isSettingsViewPresented = true
                    }) {
                        Image(systemName: "gearshape.fill")  // Updated to use a filled gear icon
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
            }
//            .background(
//                NavigationLink(destination: SettingsView(), isActive: $isSettingsViewPresented) { EmptyView() }
//            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().environment(\.locale, Locale(identifier: "zh-Hans"))
    }
}
