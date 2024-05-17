//
//  ContentView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//
import SwiftUI

struct ContentView: View {
    @State private var isSettingsViewPresented = false
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationStack {
            ZStack {
                // Background changes based on color scheme
                Image(colorScheme == .dark ? "dark_background" : "light_background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // Main content
                VStack(spacing: 20) {
                    Image(colorScheme == .dark ? "what_blocking_you_dark" : "what_blocking_you_light")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 650)
                    
                    Text("Choose a Topic")
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    HStack(spacing: 20) {
                        ForEach(["Lack of inspiration", "Self Doubt", "Perfectionism", "Burnout", "Anxiety", "Let My Creativity Flow"], id: \.self) { topic in
                            Button(action: {
                                // Action for each topic button
                                print("\(topic) button tapped") // Log the button tapped
                            }) {
                                Text(topic)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 70)
                                    .background(Color(red: 8 / 255, green: 36 / 255, blue: 55 / 255)) // Dark navy blue
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    Button(action: {
                        // Define your action here
                    }) {
                        Image(colorScheme == .dark ? "Button_dark" : "Button_light")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().environment(\.locale, Locale(identifier: "zh-Hans"))
    }
}

