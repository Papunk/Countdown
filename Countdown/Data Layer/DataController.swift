//
//  PersistenceController.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/4/22.
//


import CoreData


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Model")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
