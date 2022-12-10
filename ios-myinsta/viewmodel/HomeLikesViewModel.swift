//
//  HomeLikesViewModel.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 10/12/22.
//

import Foundation

class HomeLikesViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var posts: [Post] = []
    
    func apiPostList(completion: @escaping () -> ()) {
        isLoading = true
        posts.removeAll()
        
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image1))
        self.posts.append(Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
        
        isLoading = false
        completion()
    }
    
}
