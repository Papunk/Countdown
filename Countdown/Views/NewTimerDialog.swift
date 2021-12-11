//
//  NewTimerDialog.swift
//  Countdown
//
//  Created by Pedro Pagán on 12/9/21.
//

import SwiftUI

struct NewTimerDialog: View {
    
    @Binding var isShown: Bool
    @State var name = ""
    @EnvironmentObject var handler: TimerHandler
    
    var body: some View {
        Group {
            Text("New Timer").font(.title)
            Divider()
            TextField("Name", text: $name)
            TextField("Duration", text: $name)
            HStack {
                // Cancel Button
                Button(action: {
                    isShown = false
                }) {
                    Image(systemName: "trash")
                    Text("Cancel")
                }
                // Save Button
                Button(action: {
                    isShown = false
                }) {
                    Image(systemName: "folder")
                    Text("Save")
                }
            }
        }
        .padding()
        .frame(minWidth: 200, maxWidth: 300, minHeight: 175)
    }
    
    
    private func saveTimer() {
        // TODO add the timer to the timerhandler
    }
}

struct NewTimerDialog_Previews: PreviewProvider {
    static var previews: some View {
        NewTimerDialog(isShown: .constant(true))
    }
}
