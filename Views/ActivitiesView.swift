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
    @State private var timerText = "00:00"  // Placeholder for the timer text
    @State var prompt: DropDownMenuOption  // This should be a @State if you intend to modify it
    @Environment(\.colorScheme) var colorScheme // Added to detect the current color scheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Dynamically changing the background image based on the color scheme
                Image("vertbg")
                    .resizable()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: 1)
                VStack {
                    Spacer() // Push content to the center
                    
                    // Row of buttons for different topics
                    HStack(spacing: 20) {
                        ForEach(["Lack of inspiration", "Self Doubt", "Perfectionism", "Burnout", "Anxiety", "Let My Creativity Flow"], id: \.self) { topic in
                            Button(action: {
                                // Action for each topic button
                                print("\(topic) button tapped")
                            }) {
                                Text(topic)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 70)
                                    .background(Color(red: 8 / 255, green: 36 / 255, blue: 55 / 255))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.bottom, 40)
                    
                    // Timer Display
                    Text(timerText)
                        .font(.system(size: 48, weight: .bold, design: .monospaced))
                        .foregroundColor(.cyan)
                        .padding(.bottom, 40)
                    
                    // Displaying the prompt in a semi-transparent box
                    Text(prompt.enumOption.associatedPrompts.randomElement()!.rawValue)
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24, weight: .regular, design: .default))
                        .padding()
                        .background(Color.black.opacity(0.5))  // 50% opacity black background
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
                            Image(systemName: "pencil.tip")
                                .font(.title)
                                .padding()
                                .background(Color.green.opacity(0.8))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    
                    Spacer() // Ensure the content stays centered
                }
                .padding()
            }
        }
    }
    
    func generateNewPrompt() -> DropDownMenuOption {
        // Logic to generate a new prompt
        // Example:
        return DropDownMenuOption(option: "New Option", enumOption: .Inspiration)
    }
}

// Preview provider for ActivitiesView
struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(prompt: DropDownMenuOption(option: "", enumOption: .SelfDoubt))
    }
}
