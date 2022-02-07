//
//  ContentView.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/4/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var timerList = [TimerModel]()
    @State var addingTimer = false
    
    @FetchRequest(sortDescriptors: []) var timers: FetchedResults<TimerData>
    
    var body: some View {
        NavigationView { ListView(timerList: $timerList).frame(minWidth: 225) }
        .toolbar {
            ToolbarItem(placement:ToolbarItemPlacement.navigation) {
                Button(action: {
                    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                }, label: {
                    Image(systemName: "sidebar.leading")
                })
            }
            ToolbarItemGroup(placement: .automatic) {
                // Debug button
                Menu(content: {
                    Button(action: {
                        for i in 0...5 { timerList.append(TimerModel("Test\(i)", h: UInt16(i), m: 0, s: 0)) }
                    }, label: { Text("Add timers") })
                    Button(action: {
                        timerList.removeAll()
                    }, label: { Text("Delete all timers") })
                }, label: { Image(systemName: "ladybug") })
                // Add button
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
//        .onAppear(perform: {
//            if justLaunched {
//                fillTimers()
//                print("SavedTimers:")
//                for item in savedTimers {
//                    print(item.name!)
//                }
//            }
//            justLaunched.toggle()
//        })
    }
    
    private func fillTimers() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
