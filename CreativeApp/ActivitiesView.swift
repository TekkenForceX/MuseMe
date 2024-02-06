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
            .foregroundColor(.white)
        
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
