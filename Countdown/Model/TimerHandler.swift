//
//  TimerHandler.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/12/21.
//

import Foundation

class TimerHandler: ObservableObject {
    
    @Published var numOfTopLevelTimers = 0
    @Published var timerList: [TimerModel]
    
    init() {
        timerList = [TimerModel]()
    }
    
    // for debug
    init(_ list: [TimerModel]) {
        timerList = list
    }
    
    func addTimer(_ t: TimerModel) {
        numOfTopLevelTimers += 1
        timerList.append(t)
    }
}
