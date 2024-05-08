//
//  SignUpView.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/8/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isInputValid = false

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle sign-up logic here
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(isInputValid ? Color.blue : Color.gray)
                    .cornerRadius(15.0)
            }
            .disabled(!isInputValid)
        }
        .padding()
        .onAppear {
            // Check if the input is valid (basic example)
            self.isInputValid = !username.isEmpty && !email.isEmpty && !password.isEmpty
        }
        .onChange(of: username) { _ in self.validateInput() }
        .onChange(of: email) { _ in self.validateInput() }
        .onChange(of: password) { _ in self.validateInput() }
    }
    
    private func validateInput() {
        self.isInputValid = !username.isEmpty && !email.isEmpty && !password.isEmpty
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
