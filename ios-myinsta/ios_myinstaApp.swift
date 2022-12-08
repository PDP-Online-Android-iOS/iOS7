//
//  ios_myinstaApp.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 08/12/22.
//

import SwiftUI

@main
struct ios_myinstaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
