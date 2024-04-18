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
    var prompt: DropDownMenuOption

    var body: some View {
        NavigationStack {
            ZStack {
               
                Image("wavybg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 1000)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(prompt.enumOption.associatedPrompts.randomElement()!.rawValue)
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .font(.system(size: 12, weight: .regular, design: .default))
//                        .clipShape(RoundedRectangle (cornerSize: CGSize(width: 10, height: 10)))
                        .padding(.bottom, 40)
                        .padding()
                        

                    NavigationLink {
                        DrawingView()
                    } label: {
                        ZStack {
                            Circle()
                            
                                .frame(width: 275)
                                .foregroundColor(.cyan)
                                .opacity(0.9)
                                .shadow(color: .black,radius: 2)
    
                            Circle()
                            
                                .stroke(Color.cyan, lineWidth: 10)
                                .shadow(color: .black,radius: 50)
                                .frame(width: 275)
                            Text("Draw your muse!")
                                .font(.largeTitle.bold())
                                .shadow(color: .black,radius: 1)
                                .frame(width: 200)
                                .foregroundColor(.white)
                        }
                    }
                }.padding()
            }
        }
    }
}

// Preview provider for ActivitiesView
struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(prompt: DropDownMenuOption(option: "", enumOption: .SelfDoubt))
    }
}
