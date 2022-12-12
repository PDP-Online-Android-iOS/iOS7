//
//  SignInViewModel.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 12/12/22.
//

import Foundation

class SignInViewModel: ObservableObject {
    
    @Published var isLoading = false
    
    func apiSignIn(email: String, password: String, completion: @escaping (Bool) -> ()) {
        isLoading = true
        SessionStore().signIn(email: email, password: password, handler: { (result, error) in
            self.isLoading = false
            if error != nil {
                print("Check email or password")
                completion(false)
            } else {
                print("User signed in")
                completion(true)
            }
        })
    }
    
}
