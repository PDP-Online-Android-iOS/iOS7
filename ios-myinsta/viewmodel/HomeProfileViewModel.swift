//
//  HomeProfileViewModel.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 10/12/22.
//

import Foundation

class HomeProfileViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var posts: [Post] = []
    
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
}
