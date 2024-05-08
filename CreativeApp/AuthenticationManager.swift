//
//  AuthenticationManager.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/8/24.
//

import Foundation

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated = false

    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        // Here, add your authentication logic with your backend
        // This is a placeholder for demo purposes
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if email == "test@example.com" && password == "password123" {
                self.isAuthenticated = true
                completion(true)
            } else {
                completion(false)
            }
        }
    }

    func logout() {
        isAuthenticated = false
    }
}
