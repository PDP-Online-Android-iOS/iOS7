//
//  DatabaseService.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 12/12/22.
//

import Foundation
import FirebaseFirestore

class DatabaseStore: ObservableObject {
    var USER_PATH = "users"
    
    let store = Firestore.firestore()
    
    func saveUser(user: User) {
        let params = ["uid": user.uid, "email": user.email, "displayName": user.displayName, "password": user.password, "userImg": ""]
        
        store.collection(USER_PATH).document(user.uid!).setData(params as [String : Any])
    }
    
    func loadUser(uid: String, completion: @escaping (User?) -> ()) {
        print("UID:", uid)
        store.collection(USER_PATH).document(uid).getDocument(completion: { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                // Do something with doc data here
                print("Data:", docData as Any)
                
                let uid = docData!["uid"] as? String ?? ""
                let email = docData!["email"] as? String ?? ""
                let displayName = docData!["displayName"] as? String ?? ""
                let userImg = docData!["userImg"] as? String ?? ""
                
                var user = User(uid: uid, email: email, displayName: displayName, imgUser: userImg)
                
                completion(user)
                
            } else {
                print("User does not exist")
                completion(nil)
            }
        })
    }
    
    func updateMyImage(uid: String, userImg: String) {
        store.collection(USER_PATH).document(uid).updateData(["userImg": userImg])
    }
    
    func loadUsers(keyword: String, completion: @escaping ([User]?) -> ()) {
        var users: [User] = []
        store.collection(USER_PATH)
            .whereField("displayName", isGreaterThanOrEqualTo: keyword)
            .whereField("displayName", isLessThan: keyword + "z")
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No users")
                    return
                }
                documents.compactMap { document in
                    let uid = document["uid"] as? String ?? ""
                    let email = document["email"] as? String ?? ""
                    let displayName = document["displayName"] as? String ?? ""
                    let userImg = document["userImg"] as? String ?? ""
                    let user = User(uid: uid, email: email, displayName: displayName, imgUser: userImg)
                    users.append(user)
                }
                completion(users)
            }
    }
}
