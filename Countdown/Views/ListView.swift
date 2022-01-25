//
//  ListView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/12/21.
//

import SwiftUI

struct ListView: View {
    
    @State var addingTimer = false
    @State var timerList: [TimerModel] = []
    
    var body: some View {
        List {
            ForEach(timerList) { timer in
                HStack {
                    Text(timer.title)
                    Spacer()
                    Text(timer.format())
                    Button(action: {
                        timer.paused.toggle()
                    }, label: {
                        Image(systemName: timer.paused ? "play.fill" : "pause.fill")
                    })
                    NavigationLink(destination: TimerView(timer: timer)) {
                        Image(systemName: "rectangle.on.rectangle")
                    }
//                    Button(action: {
//
//                    }, label: {
//                    })
                }
                Divider()
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .automatic) {
                Button(action: {}) {
                    Image(systemName: "pencil")
                }
                Button(action: {}) {
                    Image(systemName: "stop.circle")
                }
                Button(action: { addingTimer.toggle() }) {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $addingTimer, onDismiss: {}) {
                    NewTimerDialog(isShown: $addingTimer, timerList: $timerList)
                }
                .keyboardShortcut("n")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
