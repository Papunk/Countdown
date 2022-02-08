//
//  ListView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/12/21.
//

import SwiftUI

struct ListView: View {
    
    @State var masterClock = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var x = 0
    
    @FetchRequest(sortDescriptors: []) var timers: FetchedResults<TimerModel>

    
    var body: some View {
        VStack {
            Text("Clock is working: \(x)s").bold().onReceive(masterClock, perform: { _ in x += 1 }).foregroundColor(.pink)
            List {
                ForEach(timers) { timer in
                    HStack {
                        NavigationLink(destination: TimerView(timer: timer, clock: $masterClock)) {
                            Text(timer.name!).fontWeight(.medium)
                            Spacer()
                            Text(timer.format()).fontWeight(timer.isActive ? .bold : .light)
                                .onReceive(masterClock, perform: { _ in
                                    if timer.isActive { timer.decrement() }
                                })
                        }
                    }
                    .padding([.top, .bottom], 10)
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
