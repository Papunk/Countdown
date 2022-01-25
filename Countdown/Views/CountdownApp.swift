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
            VStack {
                Text("Under construction")
                    .frame(width: 300, height: 80)
                Image(systemName: "hammer")
                Spacer()
            }
        }
    }
}
