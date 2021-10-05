//
//  CountdownApp.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

@main
struct CountdownApp: App {
    @State private var window: NSWindow?

    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(WindowAccessor(window: $window).setUp())
        }
        .commands {
//            CommandGroup(replacing: .newItem, addition: { })
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

struct WindowAccessor: NSViewRepresentable {
    @Binding var window: NSWindow?
    
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            self.window = view.window
        }
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
    
    func setUp() -> WindowAccessor {
        window?.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        return self
    }
}
