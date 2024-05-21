//
//  Viewodel.swift
//  MuseMe
//
//  Created by Hassan Alkhafaji on 5/20/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var enumSelection: Categories = .SelfDoubt
    
    func updateViewModelAndPrompt(for topic: String) {
        switch topic {
        case "Lack of inspiration":
            enumSelection = .Inspiration
        case "Self Doubt":
            enumSelection = .SelfDoubt
        case "Perfectionism":
            enumSelection = .Perfectionalism
        case "Let My Creativity Flow":
            enumSelection = .MuseMe
        case "Anxiety":
            enumSelection = .Anxiety
        case "Burnout":
            enumSelection = .Burnout
        default:
            break
        }
    }
}
