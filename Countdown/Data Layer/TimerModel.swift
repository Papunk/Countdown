//
//  Timer.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//


import SwiftUI

extension TimerModel {
    
    /**
     Convert the time into hh:mm:ss format
     */
    private func getHMS(from t: Int32) -> (Int32, Int32, Int32) {
        let h = Int32(t / 3600)
        let m = Int32(t % 3600 / 60)
        let s = Int32(t % 3600 % 60)
        
        return (h, m, s)
    }
    
    
    /**
     Formats the time as a string in hh:mm:ss format
     */
    public func format() -> String {
        let (h, m, s) = getHMS(from: self.timeRemaining)
        return (h >= 10 ? "" : "0") + "\(h):" + (m >= 10 ? "" : "0") + "\(m):" + (s >= 10 ? "" : "0") + "\(s)"
    }
    
    /**
     Decrements the current time by one second
     */
    public func decrement() {
        if self.timeRemaining != 0 {
            self.timeRemaining -= 1
        }
    }
    
    /**
     Resets the timer to its initial value
     */
    public func reset(_ toggle: Bool = true) {
        if toggle {
            self.toggle()
        }
        self.timeRemaining = self.duration
    }
    
    /**
     Toggles wether the timer is active or not
     */
    public func toggle() {
        self.isActive.toggle()
    }
}

/**
 This extension handles external static functions
 */
extension TimerModel {
    public static func getAbsoluteTime(h: Int?, m: Int?, s: Int?) -> Int {
        var t = 0
        t += (h ?? 0) * 3600
        t += (m ?? 0) * 60
        t += (s ?? 0)
        return t
    }
    
    public static func getAbsoluteTime(h: String, m: String, s: String) -> Int {
        let h = Int(h)
        let m = Int(m)
        let s = Int(s)
        return getAbsoluteTime(h: h, m: m, s: s)
    }
    
    public static func fill(object: TimerModel, name: String, duration: Int) {
        object.id = UUID()
        object.name = name
        object.duration = Int32(duration)
        object.timeRemaining = Int32(duration)
        object.isActive = false
        
    }
}
