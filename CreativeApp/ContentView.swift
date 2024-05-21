//
//  ContentView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//
import SwiftUI

struct ContentView: View {
    @State private var isSettingsViewPresented = false
    @State var selection = ""
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationStack {
            ZStack {
                // Background changes based on color scheme
                Image("vertbg")
                    .resizable()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: 1)
                    
                
                // Main content
                VStack(spacing: 20) {
                    Image(colorScheme == .dark ? "what_blocking_you_dark" : "what_blocking_you_light")
                        .resizable()
                        .shadow(radius: 10, x: 0, y: 10)
                        .scaledToFit()
                        .frame(width: 750)
                        .padding(.top, 15)
                    
                   
                    
                    
                    HStack(spacing: 20) {
                        ForEach(["Lack of inspiration", "Self Doubt", "Perfectionism"], id: \.self) { topic in
                            Button(action: {
                                // Action for each topic button
                                print("\(topic) button tapped") //
//                                Log the button tapped
                                selection = topic
                            }) {
                                Text(topic)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .font(.title)
                                    .background(Color(red: 8 / 255, green: 36 / 255, blue: 55 / 255))
                                   // Dark navy blue
                                    .cornerRadius(12)
                            }
                            

                        }
                    }
                    .padding(.top, 30)
                    HStack(alignment: .center, spacing: 20) {
                        ForEach([                            "Burnout", "Anxiety", "Let My Creativity Flow"], id: \.self) { topic in
                            Button(action: {
                                // Action for each topic button
                                print("\(topic) button tapped") // Log the button tapped
                                selection = topic
                            }) {
                                Text(topic)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    
                                    .background(Color(red: 8 / 255, green: 36 / 255, blue: 55 / 255))
                                   // Dark navy blue
                                    .cornerRadius(12)
                            }
                            
//                            "Burnout", "Anxiety", "Let My Creativity Flow"
                        }
                    }
                    .padding(.bottom, 30)
                    HStack {
                        
                        Text("You decide:")
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding()
                        Text(selection)
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(minWidth: 350)
                            
                        
                    }
                    .padding()
                    .background(Color(red: 8 / 255, green: 36 / 255, blue: 55 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 30)
                    
                
                    Button(action: {
                        // Define your action here
                    }) {
                        Image(colorScheme == .dark ? "Button_dark" : "Button_light")
                            .resizable()
                            .offset(y: 8)
                            .frame(width: 400, height: 400)
                            
                        
                        
                          
                    
                            
                            
                        
                    }
                    .buttonStyle(ThreeD())
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.ultraThinMaterial).opacity(0.8))
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

