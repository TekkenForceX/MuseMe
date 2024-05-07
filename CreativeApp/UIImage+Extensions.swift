//
//  UIImage+Extensions.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/3/24.
//

import UIKit
import CloudKit

extension UIImage {
    func toCKAsset() -> CKAsset? {
        guard let data = self.pngData() else { return nil }
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(NSUUID().uuidString+".dat")
        do {
            try data.write(to: url)
            return CKAsset(fileURL: url)
        } catch {
            return nil
        }
    }
}
