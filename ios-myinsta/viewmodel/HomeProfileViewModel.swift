//
//  HomeProfileViewModel.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 10/12/22.
//

import Foundation
import SwiftUI

class HomeProfileViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var posts: [Post] = []
    
    @Published var user: User?
    
    func apiPostList(completion: @escaping () -> ()) {
        isLoading = true
        posts.removeAll()
        
        self.posts.append(Post(title: "ogabekdev", content: "Decamber 10, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "Decamber 11, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "Decamber 12, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "Decamber 13, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "Decamber 14, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "Decamber 15, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "Decamber 16, 2022", imgUrl: Utils.image1))
        
        isLoading = false
        completion()
    }
    
    func apiSignOut() {
        SessionStore().signOut()
    }
    
    func apiLoadUser(uid: String) {
        isLoading = true
        DatabaseStore().loadUser(uid: uid, completion: { user in
            self.isLoading = false
            self.user = user ?? User()
        })
    }
    
    func uploadProfileImage(uid: String, photo: UIImage) {
        self.isLoading = true
        StorageStore().uploadUserImage(uid: uid, photo, completion: { downloadUrl in
            self.isLoading = false
            self.apiUpdateMyImage(uid: uid, userImg: downloadUrl)
            self.apiLoadUser(uid: uid)
        })
    }
    
    func apiUpdateMyImage(uid: String, userImg: String?) {
        self.isLoading = true
        DatabaseStore().updateMyImage(uid: uid, userImg: userImg!)
        self.isLoading = false
    }
    
}
