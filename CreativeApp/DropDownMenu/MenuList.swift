//
//  MenuList.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/31/24.
//

import SwiftUI

struct DropdownMenuList: View {
    /// The drop-down menu list options
    let options: [DropDownMenuOption]
    
    /// An action called when user select an action.
    let onSelectedAction: (_ option: DropDownMenuOption) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2) {
                ForEach(options) { option in
                    DropdownMenuListRow(option: option, onSelectedAction: self.onSelectedAction)
                }
            }
        }
        
        .frame(height: CGFloat(self.options.count * 32) > 300
               ? 300
               : CGFloat(self.options.count * 32)
        )
        .padding(.vertical, 5)
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray, lineWidth: 2)
        }
    }
}

struct DropdownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuList(options: DropDownMenuOption.creativeBlockOptions, onSelectedAction: { _ in })
    }
}
