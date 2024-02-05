//
//  MenuListRow.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/31/24.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropDownMenuOption
    
    var menuText: LocalizedStringKey {
        LocalizedStringKey(option.option)
    }
    
    let onSelectedAction: (_ option: DropDownMenuOption) -> Void
    
    var body: some View {
                    
            
//            NavigationLink {
//                ActivitiesView()
//            } label: {
//                Text(menuText)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }

            Button(action: {
                self.onSelectedAction(option)
            }) {
                Text(menuText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
            }
            .foregroundColor(.white)
            .padding(.vertical, 5)
            .padding(.horizontal)
        }
    }


struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(option: DropDownMenuOption.whatIsBlockingYou, onSelectedAction: { _ in })
        DropdownMenuListRow(option: DropDownMenuOption.whatIsBlockingYou, onSelectedAction: { _ in })
            .environment(\.locale, Locale(identifier: "zh-Hans"))
    }
}
