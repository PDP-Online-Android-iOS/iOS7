//
//  StorageStore.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 12/12/22.
//

import Foundation
import SwiftUI
import FirebaseStorage

class StorageStore: ObservableObject {
    let storageRef = Storage.storage().reference()
    
    func uploadUserImage(uid: String, _ image: UIImage, completion: @escaping (String) -> Void) {
        let imageRef = storageRef.child("users/" + uid + ".jpg")
        
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return completion("")
        }
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        imageRef.putData(imageData, metadata: metadata, completion: { (metadata, error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion("")
            }
            imageRef.downloadURL(completion: { (url, error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return completion("")
                }
                let downloadUrl = String(describing: url!)
                completion(downloadUrl)
            })
        })
        
    }
}
