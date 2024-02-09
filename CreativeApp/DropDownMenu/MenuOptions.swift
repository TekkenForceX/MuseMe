//
//  MenuOptions.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import Foundation

struct DropDownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
    let enumOption: Categories
}

extension DropDownMenuOption {
    static let whatIsBlockingYou: DropDownMenuOption = DropDownMenuOption(option: "What is blocking you?", enumOption: .SelfDoubt)
    static let creativeBlockOptions: [DropDownMenuOption] = [
        DropDownMenuOption(option: "Lack of inspiration", enumOption: .Inspiration),
        DropDownMenuOption(option: "Self doubt", enumOption: .SelfDoubt),
        DropDownMenuOption(option: "Perfectionism", enumOption: .Perfectionalism),
        DropDownMenuOption(option: "Burnout", enumOption: .Burnout),
        DropDownMenuOption(option: "Anxious", enumOption: .Anxiety),
        DropDownMenuOption(option: "Muse Me", enumOption: .MuseMe),
        
    ]
}

