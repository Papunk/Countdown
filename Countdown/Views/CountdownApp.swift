//
//  CountdownApp.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

@main
struct CountdownApp: App {
//    @State private var window: NSWindow?
    @ObservedObject var handler = TimerHandler()

    var body: some Scene {
        WindowGroup {
            ListView()
//                .navigationTitle("Hello")
//                .background(WindowAccessor(window: $window).setUp())
                .environmentObject(handler)
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
                    for window in NSApplication.shared.windows {
                        window.standardWindowButton(.zoomButton)?.isEnabled = false
                    }
                })
                .frame(minWidth: 400, idealWidth: 400, minHeight: 300, idealHeight: 300)
        }
        .commands { CommandGroup(replacing: .newItem, addition: { }) }
        WindowGroup("Timer") {
            ForEach(handler.timerList) { timer in
                if !timer.paused {
                    TimerView(timer: timer) // this may need to be a binding
                }
            }
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "OtherWindow"))
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

//struct WindowAccessor: NSViewRepresentable {
//    @Binding var window: NSWindow?
//
//    func makeNSView(context: Context) -> NSView {
//        let view = NSView()
//        DispatchQueue.main.async {
//            self.window = view.window
//        }
//        return view
//    }
//
//    func updateNSView(_ nsView: NSView, context: Context) {}
//
//    func setUp() -> WindowAccessor {
//        window?.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0.8)
//        return self
//    }
//}
