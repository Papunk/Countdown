//
//  TimerView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI
import Combine

struct TimerView: View {
    @ObservedObject var timer: TimerModel
    @Binding var clock: Publishers.Autoconnect<Timer.TimerPublisher>

    var body: some View {
        if let name = timer.name {
            VStack(alignment: .leading) {
                HStack {
                    Text(name).font(.system(size: 30, weight: .bold,  design: .default))
                    Spacer()
                    // TODO make this button look disabled when it has to
                    CustomButton(width: 10,
                                 color: .secondary,
                                 opacity: 0.5,
                                 action: { timer.reset() },
                                 content: { Image(systemName: "arrow.counterclockwise").font(.system(size: 14, weight: .heavy)) }
                    )
                        .disabled(!timer.isActive)
                    CustomButton(width: 40,
                                 height: 10,
                                 color: timer.isActive ? .red : .blue,
                                 opacity: 0.8,
                                 action: { timer.isActive.toggle()},
                                 content: { Text(timer.isActive ? "Pause" : "Start").fontWeight(.semibold) }
                    )
                }
                Divider()
                Text(timer.format()).font(.system(size: 24, design: .monospaced))
                TabView {
                    TimerHistory().tabItem({ Text("Log") })
                    TimerOptions().tabItem({ Text("Options") })
                }
                .environmentObject(timer)
            }
            .padding()
        }
        else {
            Text("Timer deleted. Undo?").foregroundColor(.secondary)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TimerModel(), clock: .constant(Timer.publish(every: 1, on: .main, in: .common).autoconnect()))
    }
}
