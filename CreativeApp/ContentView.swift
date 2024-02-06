//
//  ContentView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var blockOption: DropDownMenuOption? = nil
    @State private var trigger = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    DropdownMenu(
                        selectedOption: $blockOption,
                        placeholder: "What is blocking you?",
                        options: DropDownMenuOption.creativeBlockOptions
                    )

                    NavigationLink {
                        ActivitiesView(prompt: blockOption ?? DropDownMenuOption(option: "Lack of inspiration", enumOption: .Anxiety))
                    } label: {
                        Text("Let My Creativity Flow")
                            .frame(width: 150, height: 150)
                            .foregroundColor(.black)
                            .background(Color.cyan)
                            .clipShape(Circle())
                            .sensoryFeedback(.success, trigger: trigger)
                    }
                }
                .background(
                    Image("wavybg")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 3)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .environment(\.locale, Locale(identifier: "zh-Hans"))
    }
}
