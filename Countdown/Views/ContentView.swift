//
//  ContentView.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/4/22.
//

import SwiftUI
import CoreData



// TODO Next up: split view hierarchies



struct ContentView: View {
    
    @State var addingTimer = false
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var timers: FetchedResults<TimerModel> //TODO figure out how to use only one fetch request for all views that need it

    var body: some View {
        NavigationView { ListView().frame(minWidth: 230) }
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
                        for i in 0...5 {
                            let timer = TimerModel(context: context)
                            TimerModel.fill(object: timer, name: "Test\(i)", duration: i * 3600)
                        }
                        try? context.save()
                    }, label: { Text("Add timers") })
                    Button(action: {
                        for obj in timers {
                            context.delete(obj)
                        }
                        try? context.save()
                    }, label: { Text("Delete all timers") })
                }, label: { Image(systemName: "ladybug") })
                // Add button
                Button(action: {
                    addingTimer.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $addingTimer, onDismiss: {}) {
                    NewTimerDialog(isShown: $addingTimer)
                }
                .keyboardShortcut("n")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
