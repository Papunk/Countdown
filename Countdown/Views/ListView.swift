//
//  ListView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/12/21.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var handler = TimerHandler(
        [
            TimerModel("Computer Time", h: 4, m: 23, s: 0),
            TimerModel("Work", h: 5, m: 0, s: 0),
            TimerModel("Gaming", h: 1, m: 12, s: 0)
        ]
    )
    
    var body: some View {
        List {
            ForEach(handler.timerList) { timer in
                HStack {
                    Text(timer.title)
                    Spacer()
                    Text(timer.format())
                    Button(action: {}, label: {
                        Image(systemName: "play")
                    })
                }
                Divider()
            }
        }
        .frame(width: 300)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
