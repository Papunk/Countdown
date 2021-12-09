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
    @ObservedObject var handler = TimerHandler(
        [
            TimerModel("Computer Time", h: 4, m: 23, s: 0),
            TimerModel("Work", h: 5, m: 0, s: 0),
            TimerModel("Gaming", h: 1, m: 12, s: 0)
        ]
    )

    var body: some Scene {
        WindowGroup("Timer List") {
//            ListView()
//                .background(WindowAccessor(window: $window).setUp())
//                .environmentObject(handler)
            TimerView(timer: handler.timerList[0])
                .frame(width: 400, height: 150)
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
