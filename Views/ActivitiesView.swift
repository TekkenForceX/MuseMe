//
//  ActivitiesView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 2/2/24.
//

import SwiftUI

struct ActivitiesView: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State var timeRemaining = 60
    
    
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()  // Placeholder for the timer text
    @State var prompt: DropDownMenuOption  // This should be a @State if you intend to modify it
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.colorScheme) var colorScheme // Added to detect the current color scheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Dynamically changing the background image based on the color scheme
                Image("vertbg")
                    .resizable()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
//                    .offset(x: 0)
                VStack {
                    Spacer() // Push content to the center
                    
                    // Row of buttons for different topics
                    
                    HStack(spacing: 20) {
                        ForEach(["Lack of inspiration", "Self Doubt", "Perfectionism"], id: \.self) { topic in
                            Button(action: {
                                // Action for each topic button
                                print("\(topic) button tapped") //
//                                Log the button tapped
                                 viewModel.updateViewModelAndPrompt(for: topic)
                                prompt = DropDownMenuOption(enumOption: viewModel.enumSelection)
                                
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
                                    .shadow(color: colorScheme == .dark ? .gray.opacity(0.6) : .black.opacity(0.8),radius: 10, x: 0, y: 12)
                            }
                        }
                    }
                    .padding([.top, .bottom], 30)
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(["Burnout", "Anxiety", "Let My Creativity Flow"], id: \.self) { topic in
                            Button(action: {
                                // Action for each topic button
                                print("\(topic) button tapped") // Log the button tapped
                                
                                viewModel.updateViewModelAndPrompt(for: topic)
                          
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
                                    .shadow(color: colorScheme == .dark ? .gray.opacity(0.6) : .black.opacity(0.8), radius: 10, x: 0, y: 12)
                            }
                        }
                    }
                    .padding(.bottom, 30)
                    
                    // Timer Display
//                    Text("\(timeRemaining)")
//                        .font(.system(size: 48, weight: .bold, design: .monospaced))
//                        .foregroundColor(.cyan)
//                        .padding(.bottom, 40)
//                        .onReceive(timer) { _ in
//                            if timeRemaining > 0 {
//                                timeRemaining -= 1
//                            }
//                        }
                        
                    
                    // Displaying the prompt in a semi-transparent box
                    VStack {
                     
                        Text(prompt.enumOption.associatedPrompts.randomElement()!.rawValue)
                            .foregroundColor(.white)
                            .frame(width: 900, height: 300)
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(.system(size: 36))
                            .padding()
                    }
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.bottom, 20)
                    
                    // Shuffle and Draw buttons with icons
                    HStack {
                        Button(action: {
                            // Shuffle action should regenerate a prompt
                            prompt = generateNewPrompt()
                        }) {
                            Image(systemName: "shuffle")
                                .font(.title)
                                .padding()
                                .background(Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                        
                        NavigationLink(destination: FreeFormDrawingView()) {
                            Image("drawsymbol")
                                .resizable()
                                .frame(maxWidth: 65, maxHeight: 65)
                                
                        }
                    }
                    Spacer() // Ensure the content stays centered
                }
                .padding()
            }
            .environmentObject(viewModel)
        }
    }
    
    func generateNewPrompt() -> DropDownMenuOption {
        let newPrompt = DropDownMenuOption(enumOption: viewModel.enumSelection)
        return newPrompt
    }
}

// Preview provider for ActivitiesView
struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(prompt: DropDownMenuOption(enumOption: .SelfDoubt))
            .environmentObject(ViewModel())
    }
}
