//
//  SignUpViewModel.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 12/12/22.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var isLoading = false
    
    func apiSignUp(email: String, password: String, completion: @escaping (Bool) -> ()) {
        isLoading = true
        SessionStore().signUp(email: email, password: password, handler: { (result, error) in
            self.isLoading = false
            if error != nil {
                print("User not created")
                completion(false)
            } else {
                print("User created")
                completion(true)
            }
        })
    }
    
    func apiSaveUser(user: User) {
        DatabaseStore().saveUser(user: user)
    }
}
