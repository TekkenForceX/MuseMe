//
//  DropdownTextView.swift
//  MuseMe
//
//  Created by Calil Hall on 2/13/24.
//

import SwiftUI

struct DropdownTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .bold()
            .shadow(color:.black, radius: 1)
    }
}

#Preview {
    DropdownTextView(text: "")
}
