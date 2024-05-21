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
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var isAppeared = false
    @State private var size = 0.5
    @State private var opacity = 0.4

    var body: some View {
        NavigationStack {
            ZStack {
                // Background changes based on color scheme
                Image("vertbg")
                    .resizable()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: 0)
                    
                
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
                                    
                                    switch selection {
                                    case "Lack of inspiration":
                                        viewModel.enumSelection = .Inspiration
                                        viewModel.text = viewModel.updateText(for: viewModel.enumSelection)
                                    case "Self Doubt":
                                        viewModel.enumSelection = .SelfDoubt
                                        viewModel.text = viewModel.updateText(for: viewModel.enumSelection)
                                    case "Perfectionism":
                                        viewModel.enumSelection = .Perfectionalism
                                        viewModel.text = viewModel.updateText(for: viewModel.enumSelection)
                                    default:
                                        break
                                    }
                                }) {
                                    Text(topic)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("textC"))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .font(.title)
                                        .background(Color("buttonbg").opacity(colorScheme == .dark ? 0.8 : 1))
                                    // Dark navy blue
                                        .cornerRadius(12)
                                        .shadow(color: colorScheme == .dark ? .gray.opacity(0.6) : .black.opacity(0.8),radius: 6, x: 0, y: 10)
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
                                    
                                    switch selection {
                                    case "Let My Creativity Flow":
                                        viewModel.enumSelection = .MuseMe
                                        viewModel.text = viewModel.updateText(for: viewModel.enumSelection)
                                    case "Anxiety":
                                        viewModel.enumSelection = .Anxiety
                                        viewModel.text = viewModel.updateText(for: viewModel.enumSelection)
                                    case "Burnout":
                                        viewModel.enumSelection = .Burnout
                                        viewModel.text = viewModel.updateText(for: viewModel.enumSelection)
                                    default:
                                        break
                                    }
                                    
                                    
                                }) {
                                    Text(topic)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("textC"))
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    
                                        .background(Color("buttonbg").opacity(colorScheme == .dark ? 0.8 : 1))
                                    // Dark navy blue
                                        .cornerRadius(12)
                                        .shadow(color: colorScheme == .dark ? .gray.opacity(0.6) : .black.opacity(0.8), radius: 6, x: 0, y: 10)
                                }
                                
                                //                            "Burnout", "Anxiety", "Let My Creativity Flow"
                            }
                        }
                        .padding(.bottom, 30)
                        HStack {
                            
                            Text("You decide:")
                                .font(.title)
                                .foregroundStyle(Color("textC"))
                                .fontWeight(.bold)
                                .padding()
                            Text(selection)
                                .font(.title)
                                .foregroundStyle(Color("textC"))
                                .fontWeight(.bold)
                                .padding()
                                .frame(minWidth: 350)
                            
                            
                        }
                        .padding()
                        .background(Color("buttonbg").opacity(colorScheme == .dark ? 0.8 : 1))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.bottom, 30)
                        .shadow(color: colorScheme == .dark ? .gray.opacity(0.6) : .black.opacity(0.8), radius: 6, x: 0, y: 10)
                        
                        
                        NavigationLink{
                            // Define your action here
                            //                        ActivityView( DropDownMenuOption(option: "", enumOption: .SelfDoubt))
                         
                                ActivitiesView(prompt: DropDownMenuOption(enumOption: viewModel.enumSelection))
                                
                            
                        } label:  {
                            Image(colorScheme == .dark ? "Button_dark" : "Button_light")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .padding(.bottom, 15)
                                .shadow(color: colorScheme == .dark ? .gray.opacity(0.6) : .black, radius: 10, x: 0, y: 12)
                            
                            
                        }
                        .buttonStyle(ThreeD())
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(.ultraThinMaterial).opacity(0.8))
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            size = 1
                            opacity = 1.0
                        }
                    }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isAppeared = true
                }
            }
//            TODO: Implement this later
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        isSettingsViewPresented = true
//                    }) {
//                        Image(systemName: "gear")
//                            .resizable()
//                            .fontWeight(.bold)
//                            .tint(colorScheme == .dark ? Color.white : Color("buttonbg"))
//                            .frame(width: 50, height: 50)
//                    }
//                }
//            }
            .environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .environmentObject(ViewModel())
            
    }
}

