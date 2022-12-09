//
//  SessionStore.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import Foundation
import Combine

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var user: User? { didSet { self.didChange.send(self) } }
    
    func listen() {
        self.user = User(uid: "asd", email: "asd", displayName: "asd")
//        self.user = nil
    }
}
