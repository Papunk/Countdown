//
//  PersistenceController.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/4/22.
//

import Foundation
import CoreData


struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview = PersistenceController(inMemory: true)

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "Model")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        
        
        func save() {
            let context = container.viewContext

            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    // Show some error here
                }
            }
        }
    }
}
