//
//  TimerHandler.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/12/21.
//

import Foundation

class TimerHandler: ObservableObject {
    
    var timerList: [TimerModel]
    
    init() {
        timerList = [TimerModel]()
    }
}
