//
//  ProfileView.swift
//  MuseMe
//
//  Created by Angelo Brown on 4/29/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile Details")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}
