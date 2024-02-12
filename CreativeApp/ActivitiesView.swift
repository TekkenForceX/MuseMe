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
                    .ignoresSafeArea()

                VStack {
                    Text(prompt.enumOption.associatedPrompts.randomElement()!.rawValue)
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                        .padding(.bottom, 40)

                    NavigationLink {
                        DrawingView()
                    } label: {
                        ZStack {
                            Circle()
                                .stroke(Color.cyan, lineWidth: 10)
                                .frame(width: 300)
                            Text("Let my creativity Flow!")
                                .font(.largeTitle)
                                .frame(width: 200)
                                .foregroundColor(.white)
                        }
                    }
                }
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
