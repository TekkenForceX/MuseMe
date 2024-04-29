//
//  AccountSettingsView.swift
//  MuseMe
//
//  Created by Angelo Brown on 4/29/24.
//

import SwiftUI

struct AccountSettingsView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section(header: Text("Change Password")) {
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm Password", text: $confirmPassword)
            }
            
            Section {
                Button("Save Changes") {
                    onSave()
                }
            }
        }
        .navigationTitle("Account Settings")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Update"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func onSave() {
        if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return
        }
        
        if !newPassword.isEmpty && newPassword != confirmPassword {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }

        // Here, add your logic to save the changes to your backend
        alertMessage = "Your changes have been saved."
        showAlert = true
        
        // Example: Print statements for debugging
        print("Username: \(username)")
        print("Email: \(email)")
        print("New Password: \(newPassword)")
    }

    func isValidEmail(_ email: String) -> Bool {
        // Basic validation to check if email address format is correct
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AccountSettingsView()
        }
    }
}
