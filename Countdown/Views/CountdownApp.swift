//
//  CountdownApp.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI
import CoreData

@main
struct CountdownApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .commands {
            CommandGroup(replacing: .newItem, addition: { })
            SidebarCommands()
        }
        
        Settings {
            SettingsView()
                .frame(width: 300, height: 300)
        }
    }
}


struct Tab: View {
    var systemName: String
    var text: String
    
    var body: some View {
        Image(systemName: systemName)
        Text(text)
    }
}
