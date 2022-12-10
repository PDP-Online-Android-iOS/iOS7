//
//  HomeSearchViewModel.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 10/12/22.
//

import Foundation

class HomeSearchViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var users: [User] = []
    
    func apiUsersList(completion: @escaping () -> ()) {
        isLoading = true
        users.removeAll()
        
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        self.users.append(User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
        
        isLoading = false
        completion()
    }
}
