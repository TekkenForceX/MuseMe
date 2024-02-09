//
//  ActivitiesView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 2/2/24.
//

import SwiftUI

struct ActivitiesView: View {
    var prompt: DropDownMenuOption
    var body: some View {
        ZStack {
            Image("wavybg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text(prompt.enumOption.associatedPrompts.randomElement()!.rawValue)
                    .foregroundColor(.white)
                    .padding()
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 16, height: 16)))
                
            }
        }
        
    }
    }

#Preview {
    ActivitiesView(prompt: DropDownMenuOption(option: "", enumOption: .SelfDoubt))
}



