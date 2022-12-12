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
    
    func apiUsersList(uid: String, keyword: String) {
        isLoading = true
        users.removeAll()
        
        DatabaseStore().loadUsers(keyword: keyword) { users in
            self.users = users!
            self.isLoading = false
        }
    }
}
