//
//  ListView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/12/21.
//

import SwiftUI

struct ListView: View {
    
    @Binding var timerList: [TimerModel]
    
    var body: some View {

        List {
            ForEach(timerList) { timer in
                HStack {
                    NavigationLink(destination: TimerView(timer: timer)) {
                        Text(timer.title)
                        Spacer()
                        Text(timer.format())
                    }
                }
                Divider()
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(timerList: .constant([]))
    }
}
