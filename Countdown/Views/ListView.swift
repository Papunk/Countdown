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
    @Environment(\.managedObjectContext) var context
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
                            Text(timer.format())
                                .font(.system(size: 14, weight: timer.isActive ? .bold : .regular, design: .monospaced))
                                .onReceive(masterClock, perform: { t in
                                    if timer.isActive {
                                        timer.decrement()
//                                        print(t.formatted(.iso8601))
                                    }
                                })
                        }
                    }
                    .padding([.top, .bottom], 5)
                }
            }
            .listStyle(SidebarListStyle())
        }
        // TODO doing this every second may be horribly inneficient,
        // however, changes must not go unsaved...
        .onReceive(masterClock) { _ in
            try? context.save()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
