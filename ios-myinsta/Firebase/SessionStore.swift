//
//  SessionStore.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import Foundation
import Combine
import Firebase

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var user: User? { didSet { self.didChange.send(self) } }
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                self.user = User(uid: user.uid, email: user.email, displayName: user.displayName)
            } else {
                self.user = nil
            }
        }
    }
    
    // additional methods (sign up, sign in) will go here
    
    func signUp(email: String, password: String, handler: @escaping (AuthDataResult?, Error?) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        }
        
        func signIn(email: String, password: String, handler: @escaping (AuthDataResult?, Error?) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        }
        
        func signOut () -> Bool {
            do {
                try Auth.auth().signOut()
                self.user = nil
                return true
            } catch {
                return false
            }
        }
}
