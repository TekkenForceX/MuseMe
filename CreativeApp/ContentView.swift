//
//  ContentView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var blockOption: DropDownMenuOption? = nil
    @State var trigger = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ZStack {
                        Text("Muse Me")
                            .font(.system(size: 80)).bold()
                            .foregroundColor(.cyan)
                            .padding(.leading)
                            .offset(x:3, y:3)
                        
                        Text("Muse Me")
                            .font(.system(size: 80)).bold()
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                    DropdownMenu(
                        selectedOption: $blockOption,
                        placeholder: "What's blocking you?",
                        options: DropDownMenuOption.creativeBlockOptions
                    )

                    NavigationLink {
                        ActivitiesView(prompt: blockOption ?? DropDownMenuOption(option: "Lack of inspiration", enumOption: .MuseMe))
                    } label: {
                        ZStack {
                            Circle()
                            
                                .frame(width: 275)
                                .foregroundColor(.cyan)
                                .opacity(0.9)
                                .shadow(color: .black,radius: 2)
                            
                            Circle()
                            
                                .stroke( .cyan, lineWidth: 10)
                                .shadow(color: .black,radius: 50)
                                .frame(width: 275)
                            Circle()
                            
                                .stroke( .babyGreen, lineWidth: 1)
                                .shadow(color: .black,radius: 50)
                                .frame(width: 285)
                            
                           
                            
                            Text("Generate Muse")
                                .font(.largeTitle.bold())
                                .shadow(color: .black,radius: 1)
                                .frame(width: 200)
                                .foregroundColor(.white)
                                .sensoryFeedback(.success, trigger: trigger)
                        }
                    }
                }
                .background(
                    Image("background")
                        .resizable()  // Make the image resizable
                        .scaledToFill() // Scale the image to fill the view
                    // Added frame and changed width to make the app fit
                        .frame(width: .infinity, height: 884)
                        .edgesIgnoringSafeArea(.all) // Let the image extend to the edges of the screen
                        .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
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
