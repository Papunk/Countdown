//
//  Timer.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import AVFoundation

// TODO make time class

class TimerModel: ObservableObject {
    var title: String
    var children: [TimerModel]
    var parent: TimerModel?
    var duration: (Int, Int, Int)
    @Published var timeLeft: (Int, Int, Int)
    
    init(_ title: String, h: Int, m: Int, s: Int) {
        self.title = title
        children = []
        parent = nil
        duration = (h, m, s)
        timeLeft = (h, m, s)
    }
    
    func validTime(_ h: Int, _ m: Int, _ s: Int) -> Bool {
        return true
    }

    func decrement() {
        if s() > 0 {
            timeLeft.2 -= 1
        }
        else {
            if m() > 0 {
                timeLeft.1 -= 1
            }
            else {
                if h() > 0 {
                    timeLeft.0 -= 1
                }
                else {
                    return
                }
                timeLeft.1 = 59
            }
            timeLeft.2 = 59
        }
    }
    
    func h() -> Int { timeLeft.0 }
    func m() -> Int { timeLeft.1 }
    func s() -> Int { timeLeft.2 }
}


struct Time {
    var h: UInt8
    var m: UInt8
    var s: UInt8
}
