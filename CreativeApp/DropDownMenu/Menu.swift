////
////  Menu.swift
////  CreativeApp
////
////  Created by Matthew Fails on 1/29/24.
////
//
//import SwiftUI
//
//struct DropdownMenu: View {
//    /// Used to show or hide drop-down menu options
//    @State private var isOptionsPresented: Bool = false
//    
//    /// Used to bind user selection
//    @Binding var selectedOption: DropDownMenuOption?
//    
//    /// A placeholder for drop-down menu
//    let placeholder: String
//    
//    /// The drop-down menu options
//    let options: [DropDownMenuOption]
//    
//    var body: some View {
//        Button(action: {
//            withAnimation {
//                self.isOptionsPresented.toggle()
//                
//                
//            }
//        }) {
//            HStack {
//                Text(selectedOption == nil ? placeholder : selectedOption!.option)
//                    .fontWeight(.medium)
//                    .foregroundColor(selectedOption == nil ? .white : .white)
//                    .font(.largeTitle)
//                    .bold()
//                    .environment(\.locale, Locale(identifier: "zh-Hans"))
//                
//                Spacer()
//                
//                Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
//                    // This modifier available for Image since iOS 16.0
//                    .fontWeight(.medium)
//                
//            }
//        }
//        .padding()
//        .background(.gray)
//        .cornerRadius(24)
//        .overlay {
////            RoundedRectangle(cornerRadius: 24)
////                .stroke(.cyan, lineWidth: 2)
//                
//        }
//        .overlay(alignment: .top) {
//            VStack {
//                if self.isOptionsPresented {
//                    Spacer(minLength: 70)
//                    DropdownMenuList(options: self.options) { option in
//                        self.isOptionsPresented = false
//                        self.selectedOption = option
//                    }
//                }
//            }
//        }
//        .padding(.horizontal)
//        // We need to push views under drop down menu down, when options list is
//        // open
//        .padding(
//            // Check if options list is open or not
//            .bottom, self.isOptionsPresented
//            // If options list is open, then check if options size is greater
//            // than 300 (MAX HEIGHT - CONSTANT), or not
//            ? CGFloat(self.options.count * 70) > 300
//                // IF true, then set padding to max height 300 points
//                ? 300 + 30 // max height + more padding to set space between borders and text
//                // IF false, then calculate options size and set padding
//                : CGFloat(self.options.count * 70) + 30
//            // If option list is closed, then don't set any padding.
//            : 190
//        )
//    }
//}
//
//struct DropdownMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        DropdownMenu(
//            selectedOption: .constant(nil),
//            placeholder: "What is blocking you?",
//            options: DropDownMenuOption.creativeBlockOptions
//        )
//    }
//}
