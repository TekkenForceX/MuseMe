//
//  MenuListRow.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/31/24.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropDownMenuOption
    
    
    let onSelectedAction: (_ option: DropDownMenuOption) -> Void
    
    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(option: DropDownMenuOption.whatIsBlockingYou, onSelectedAction: { _ in })
    }
}
