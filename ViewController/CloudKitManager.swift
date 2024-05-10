//
//  CloudKitManager.swift
//  MuseMe
//
//  Created by Angelo Brown on 5/3/24.
//

import CloudKit
import UIKit

class CloudKitManager {
    static let shared = CloudKitManager()
    
    private init() {}

    // MARK: - Save Drawing
    func saveDrawing(drawing: Drawing, completion: @escaping (Bool, Error?) -> Void) {
        let record = CKRecord(recordType: "Drawing")
        record["title"] = drawing.title
        record["imageAsset"] = drawing.image.toCKAsset()

        CKContainer.default().privateCloudDatabase.save(record) { record, error in
            completion(error == nil, error)
        }
    }

    // MARK: - Fetch Drawings
    func fetchDrawings(completion: @escaping ([Drawing]?, Error?) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Drawing", predicate: predicate)

        CKContainer.default().privateCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            let drawings = records?.compactMap { record -> Drawing? in
                guard let title = record["title"] as? String,
                      let asset = record["imageAsset"] as? CKAsset,
                      let data = try? Data(contentsOf: asset.fileURL!),
                      let image = UIImage(data: data) else {
                    return nil
                }
                return Drawing(title: title, image: image)
            }
            completion(drawings, error)
        }
    }
}
