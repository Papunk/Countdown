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
            Text(timer.title)
                .font(.title)
            Divider()
            Text("\(timer.h()):\(timer.m()):\(timer.s())")
                .bold()
                .onReceive(clock, perform: { _ in
                    timer.decrement()
                })
        }
        .frame(width: 200, height: 100)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TimerModel("Computer Time", h: 5, m: 30, s: 10))
    }
}
