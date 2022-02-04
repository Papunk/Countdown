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
        VStack {
            HStack {
                Text(timer.title).font(.system(size: 30, weight: .bold,  design: .rounded))
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TimerModel("Computer Time", h: 5, m: 30, s: 10), clock: .constant(Timer.publish(every: 1, on: .main, in: .common).autoconnect()))
    }
}
