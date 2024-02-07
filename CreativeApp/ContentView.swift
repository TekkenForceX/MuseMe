//
//  ContentView.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var blockOption: DropDownMenuOption? = nil
    @State private var trigger = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Muse Me")
                        .font(.system(size: 80)).bold()
                        .foregroundColor(.cyan)
                        .padding(.leading)
                    DropdownMenu(
                        selectedOption: self.$blockOption,
                        placeholder: "What is blocking you?", 
                        options: DropDownMenuOption.creativeBlockOptions
                        
                        
                    )
                    
                    //            Text(blockOption?.option ?? "")
                    
                    //                    Button(action: {
                    //                        print("Round Action")
                    //                        trigger.toggle()
                    //                    }) {
                    //                        Text("Let My Creativity Flow")
                    //                            .frame(width : 150, height: 150)
                    //                            .foregroundColor(.black)
                    //                            .background(Color.red)
                    //                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    //                            .sensoryFeedback(.success, trigger: trigger)
                    //                    }
                    
                    
                    NavigationLink {
                        ActivitiesView(prompt: blockOption ?? DropDownMenuOption(option: "Lack of inspiration", enumOption: .Anxiety))
                    } label: {
                        ZStack {
                            Circle()
                                .stroke(Color.cyan, style: StrokeStyle(lineWidth: 10))
                                .sensoryFeedback(.success, trigger: trigger)
                                .frame(width:300)
                            Text("Generate Muse")
                                .font(.largeTitle)
                                .frame(width : 200)
                                .foregroundColor(.white)
                               // .background(Color.cyan)
                               // .clipShape(Circle())
                                .sensoryFeedback(.success, trigger: trigger)
                        }
                    }
                }.background(
                    Image("wavybg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 420, height: 100)
                        .blur(radius: 3))
                    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .environment(\.locale, Locale(identifier: "zh-Hans"))
    }
}

