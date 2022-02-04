//
//  Timer.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

class TimerModel: ObservableObject, Identifiable {
    var title: String
    var children: [TimerModel]
    var parent: TimerModel?
    var duration: (h: UInt16, m: UInt8, s: UInt8)
    @Published var isActive = false
    @Published var h: UInt16
    @Published var m: UInt8
    @Published var s: UInt8
    var ID: UUID
    
    // TODO make initializer that takes the seconds and isActive
    
    init(_ title: String, h: UInt16, m: UInt8, s: UInt8) {
        self.title = title
        children = []
        parent = nil
        duration = (h, m, s)
        self.h = h
        self.m = m
        self.s = s
        self.ID = UUID()
    }
    
    init(_ title: String, h: String, m: String, s: String) {
        self.title = title
        children = []
        parent = nil
        
        // TODO input validation
        
        let hNum = UInt16(Int(h) ?? 0)
        let mNum = UInt8(Int(m) ?? 0)
        let sNum = UInt8(Int(s) ?? 0)
    
        duration = (hNum, mNum, sNum)
        self.h = hNum
        self.m = mNum
        self.s = sNum
        self.ID = UUID()
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
    func decrement() -> Bool {
        if s == 0 && m == 0 && h == 0 {
            return false
        }
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
                    return true
                }
                m = 59
            }
            s = 59
        }
        return true
    }
    
    /**
     Resets the timer to its initial value
     */
    func reset() {
        h = duration.h
        m = duration.m
        s = duration.s
    }
    
    
    func toggle() {
        self.isActive.toggle()
    }
    
    
    /**
     
     */
//    private func normalize(_ h: UInt8, _ m: UInt8, _ s: UInt8) -> (h: UInt8, m: UInt8, s: UInt8) {
//
//        return (0,0,0)
//    }
    
    /**
     Ensure that the parameters for hours, minutes, and seconds are valid
     */
//    private func validate(_ nums: UInt8...) -> Bool {
//        for num in nums {
//            // Do test
//        }
//        return true
//    }
}









/**
 Models a time with an hours, minutes, and seconds
 */
//class Time: ObservableObject {
//    // times are not negative and won't be too big so small unsigned integers make sense
//    @Published var h: UInt8
//    @Published var m: UInt8
//    @Published var s: UInt8
//
//    init(_ h: UInt8, _ m: UInt8, _ s: UInt8) {
//        self.h = h
//        self.m = m
//        self.s = s
//    }
//
//    /**
//     Formats the time as a string in hh:mm:ss format
//     */
//    func format() -> String {
//        return (h >= 10 ? "" : "0") + "\(h):" + (m >= 10 ? "" : "0") + "\(m):" + (s >= 10 ? "" : "0") + "\(s)"
//    }
//
//    /**
//     Decrements the current time by one second
//     */
//    func decrement() {
//        if s > 0 {
//            s -= 1
//        }
//        else {
//            if m > 0 {
//                m -= 1
//            }
//            else {
//                if h > 0 {
//                    h -= 1
//                }
//                else {
//                    return
//                }
//                m = 59
//            }
//            s = 59
//        }
//    }
//
//    /**
//     Increments the current time by one second
//     */
//    func increment() {
//    }
//}
