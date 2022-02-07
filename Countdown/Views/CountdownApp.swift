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
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        .commands {
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
