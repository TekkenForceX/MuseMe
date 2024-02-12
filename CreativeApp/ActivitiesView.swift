//
//  ActivitiesView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 2/2/24.
//

import SwiftUI


struct ActivitiesView: View {
    @State private var currentLine =  Line()
    @State private var lines: [Line] = []
    var prompt: DropDownMenuOption
    var body: some View {
        NavigationStack{
            ZStack {
                Image("wavybg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                   
                    
                    Text(prompt.enumOption.associatedPrompts.randomElement()!.rawValue)
                    //                .overlay {
                    //                    RoundedRectangle(cornerRadius: 13)
                    //                        .stroke(.cyan, lineWidth: 3)
                    //                }
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                    //                .offset(x: 0, y: -50)
                        .font(.title)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    
                    
                    NavigationLink {
                        DrawingView()
                    } label: {
                        ZStack {
                            Text("Let my creativity Flow!")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 200)
                             .background(Color.cyan)
                             .clipShape(Circle())
                            
                            
                            //                            .offset(y: 150)
                            // .background(Color.cyan)
                            // .clipShape(Circle())
                            
                        }
                    }
                }
                
                //                .background(
                //                    Image("wavybg")
                //                        .resizable()
                //                        .scaledToFill()
                //                    .frame(width: 420, height: 100))
            }
            
        }
    }
}

#Preview {
    ActivitiesView(prompt: DropDownMenuOption(option: "", enumOption: .SelfDoubt))
}
