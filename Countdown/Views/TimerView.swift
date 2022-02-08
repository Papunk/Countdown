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
            VStack {
                HStack {
                    Text(name).font(.system(size: 30, weight: .bold,  design: .rounded))
                    Spacer()
                    Button(action: { timer.reset() }, label: { Image(systemName: "arrow.counterclockwise") })
                    Button(action: { timer.isActive.toggle() }, label: {
                        Text(timer.isActive ? "Stop" : "Start")
                    })
                }
                .padding()
                Divider()
                Text(timer.format()).font(.system(size: 24, design: .monospaced))
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TimerModel(), clock: .constant(Timer.publish(every: 1, on: .main, in: .common).autoconnect()))
    }
}
