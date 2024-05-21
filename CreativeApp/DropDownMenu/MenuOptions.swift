//
//  MenuOptions.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import Foundation

struct DropDownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    
    let enumOption: Categories
}

extension DropDownMenuOption {
    static let whatIsBlockingYou: DropDownMenuOption = DropDownMenuOption(enumOption: .SelfDoubt)
    static let creativeBlockOptions: [DropDownMenuOption] = [
        DropDownMenuOption(enumOption: .Inspiration),
        DropDownMenuOption(enumOption: .SelfDoubt),
        DropDownMenuOption(enumOption: .Perfectionalism),
        DropDownMenuOption(enumOption: .Burnout),
        DropDownMenuOption(enumOption: .Anxiety),
        DropDownMenuOption(enumOption: .MuseMe),
        
    ]
}

