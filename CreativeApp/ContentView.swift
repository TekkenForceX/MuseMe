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
<<<<<<< Updated upstream
        NavigationStack {
            ZStack {
                VStack {
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
                        ActivitiesView(prompt: blockOption ?? DropDownMenuOption(option: "Lack of inspiration"))
                    } label: {
                        Text("Let My Creativity Flow")
                            .frame(width : 150, height: 150)
                            .foregroundColor(.black)
                            .background(Color.cyan)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .sensoryFeedback(.success, trigger: trigger)
                    }
                }.background(
                    Image("wavybg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 420, height: 100)
                        .blur(radius: 3))
                    
=======
        
        ZStack {
            VStack {
                Text("Muse Me")
                    

                                DropdownMenu(
                    selectedOption: self.$blockOption,
                    placeholder: "What is blocking you?",
                    options: DropDownMenuOption.creativeBlockOptions
                )
                
                
                DropdownMenu(
                    selectedOption: self.$blockOption,
                    placeholder: "What is blocking you?",
                    options: DropDownMenuOption.creativeBlockOptions
>>>>>>> Stashed changes
                    
            }
            //        Button("Tap Count: \(counter)"){
            //            counter += 1
            //            trigger.toggle()
            //        }
            //        .sensoryFeedback(.warning, trigger: trigger)
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

