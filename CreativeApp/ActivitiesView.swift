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
        Text(prompt.enumOption.associatedPrompts.randomElement()!.rawValue)
            .overlay {
                RoundedRectangle(cornerRadius: 13)
                    .stroke(.cyan, lineWidth: 3)
            }
            .foregroundColor(.white)
            .bold()
            .multilineTextAlignment(.center)
            .offset(x: 0, y: -50)
            .font(.title)
            .font(.system(size: 15, weight: .regular, design: .default))
        
        
            .background(
                Image("wavybg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 420, height: 100))
    }
}

#Preview {
    ActivitiesView(prompt: DropDownMenuOption(option: "", enumOption: .SelfDoubt))
}
