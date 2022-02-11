//
//  TimerHistory.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/10/22.
//

import SwiftUI

struct TimerHistory: View {
    
    @EnvironmentObject var timer: TimerModel
    
    
    var body: some View {
        List {
            ForEach(0..<20) { i in
                Text("This is row #\(i)").padding([.top, .bottom], 5)
            }
        }
        .listStyle(.inset(alternatesRowBackgrounds: true))
    }
}

struct TimerHistory_Previews: PreviewProvider {
    static var previews: some View {
        TimerHistory()
            .environmentObject(TimerModel())
    }
}
