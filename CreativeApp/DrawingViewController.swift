//
//  DrawingViewController.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/3/24.
//

import UIKit

class DrawingViewController: UIViewController {
    
    // Assuming you have a method to create a new drawing which is triggered by a user action
    func createDrawing(image: UIImage, title: String) {
        let newDrawing = Drawing(title: title, image: image)
        CloudKitManager.shared.saveDrawing(drawing: newDrawing) { success, error in
            if success {
                print("Drawing saved successfully!")
                DispatchQueue.main.async {
                    // Optionally update your UI here
                }
            } else {
                print("Error saving drawing: \(String(describing: error))")
            }
        }
    }

    // Method to fetch all drawings, could be called on viewDidLoad or a refresh action
    func loadDrawings() {
        CloudKitManager.shared.fetchDrawings { [weak self] drawings, error in
            DispatchQueue.main.async {
                if let drawings = drawings {
                    // Update your UI with the drawings
                } else {
                    print("Error fetching drawings: \(String(describing: error))")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDrawings()
    }

    // Add other UI and interaction handling methods here
}
