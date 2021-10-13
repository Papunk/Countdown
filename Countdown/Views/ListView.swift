//
//  ListView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/12/21.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var handler = TimerHandler()
    
    var body: some View {
        List {
            ForEach(handler.timerList) { timer in
                HStack {
                    Text(timer.title)
                    Spacer()
                    Text(timer.format())
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
