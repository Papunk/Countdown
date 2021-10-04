//
//  Timer.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import AVFoundation


class TimerModel: ObservableObject {
    var title: String
    var children: [TimerModel]
    var parent: TimerModel?
    var duration: Time
    @Published var timeLeft: Time
    
    init(_ title: String, h: UInt8, m: UInt8, s: UInt8) {
        self.title = title
        children = []
        parent = nil
        duration = Time(h, m, s)
        timeLeft = Time(h, m, s)
    }
    
    func decrement() { timeLeft.decrement() }
    func increment() { timeLeft.increment() }
}

/**
 Models a time with an hours, minutes, and seconds
 */
class Time {
    // times are not negative and won't be too big so small unsigned integers make sense
    var h: UInt8
    var m: UInt8
    var s: UInt8
    
    init(_ h: UInt8, _ m: UInt8, _ s: UInt8) {
        self.h = h
        self.m = m
        self.s = s
    }
    
    /**
     Formats the time as a string in hh:mm:ss format
     */
    func format() -> String {
        return (h >= 10 ? "" : "0") + "\(h):" + (m >= 10 ? "" : "0") + "\(m):" + (s >= 10 ? "" : "0") + "\(s)"
    }
    
    /**
     Decrements the current time by one second
     */
    func decrement() {
        if s > 0 {
            s -= 1
        }
        else {
            if m > 0 {
                m -= 1
            }
            else {
                if h > 0 {
                    h -= 1
                }
                else {
                    return
                }
                m = 59
            }
            s = 59
        }
    }
    
    /**
     Increments the current time by one second
     */
    func increment() {
    }
}
