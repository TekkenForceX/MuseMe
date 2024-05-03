//
//  AuthenticationManager.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/3/24.
//

import CloudKit

class AuthenticationManager {
    
    func checkiCloudStatus(completion: @escaping (Bool) -> Void) {
        CKContainer.default().accountStatus { status, error in
            DispatchQueue.main.async {
                switch status {
                case .available:
                    completion(true)
                case .noAccount:
                    let message = "Please log in to your iCloud account to use this feature."
                    self.promptForiCloud(message: message)
                    completion(false)
                case .restricted, .couldNotDetermine:
                    let message = "Unable to access iCloud. iCloud might be restricted on this device."
                    self.promptForiCloud(message: message)
                    completion(false)
                @unknown default:
                    completion(false)
                }
            }
        }
    }
    
    private func promptForiCloud(message: String) {
        // Implement your alert presentation logic here to notify the user
        print(message) // Placeholder for actual UI implementation
    }
}
