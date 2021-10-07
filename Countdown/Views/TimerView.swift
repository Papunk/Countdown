//
//  TimerView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var timer: TimerModel
    let clock = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            HStack {
                Text(timer.title).font(.system(size: 30, weight: .bold,  design: .rounded))
                Button(action: {
                    timer.reset()
                }, label: {
                    Image(systemName: "arrow.counterclockwise")
                })
                Button(action: {
                    timer.paused.toggle()
                }, label: {
                    Image(systemName: timer.paused ? "play" : "pause")
                })
            }
            Divider()
            Text(timer.format())
                .font(.system(size: 24, design: .monospaced))
                .onReceive(clock, perform: { _ in
                    if !timer.paused {
                        timer.decrement()
                    }
                })
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TimerModel("Computer Time", h: 5, m: 30, s: 10))
    }
}
