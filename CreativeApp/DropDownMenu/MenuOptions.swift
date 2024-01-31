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
}

extension DropDownMenuOption {
    static let whatIsBlockingYou: DropDownMenuOption = DropDownMenuOption(option: "What is blocking you?")
    static let creativeBlockOptions: [DropDownMenuOption] = [
        DropDownMenuOption(option: "Lack of inspiration"),
        DropDownMenuOption(option: "Self doubt"),
        DropDownMenuOption(option: "Perfectionism"),
        DropDownMenuOption(option: "Burnout"),
        DropDownMenuOption(option: "Anxious"),
    ]
}

