//
//  CountdownApp.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

@main
struct CountdownApp: App {
    
    @State var timerList = [TimerModel]()
    @State var addingTimer = false

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView(timerList: $timerList)
                    .frame(minWidth: 200)
            }
            .toolbar {
                ToolbarItem(placement:ToolbarItemPlacement.navigation) {
                    Button(action: {
                        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                    }, label: {
                        Image(systemName: "sidebar.leading")
                    })
                }
                ToolbarItemGroup(placement: .automatic) {
                    Button(action: {
                        for i in 0...5 { timerList.append(TimerModel("Test\(i)", h: UInt8(i), m: 0, s: 0)) }
                    }, label: {
                        Image(systemName: "ladybug")
                    })
                    Button(action: {
                        addingTimer.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $addingTimer, onDismiss: {}) {
                        NewTimerDialog(isShown: $addingTimer, timerList: $timerList)
                    }
                    .keyboardShortcut("n")
                }
            }
        }
        .commands {
            CommandGroup(replacing: .newItem, addition: { })
            SidebarCommands()
        }
        
        
        Settings {
            TabView {
                GeneralSettingsPage()
                .tabItem {
                    Tab(systemName: "gearshape", text: "General")
                }
                GeneralSettingsPage()
                .tabItem {
                    Tab(systemName: "paintbrush", text: "Customization")
                }
                GeneralSettingsPage()
                .tabItem {
                    Tab(systemName: "keyboard", text: "Shortcuts")
                }
            }
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
