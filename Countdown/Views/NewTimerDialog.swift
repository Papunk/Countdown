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
    @State var hours = ""
    @State var minutes = ""
    @State var seconds = ""
    @EnvironmentObject var handler: TimerHandler
    
    var body: some View {
        Group {
            Text("New Timer").font(.title)
            Divider()
            TextField("Name", text: $name)
            HStack {
                TextField("00", text: $hours) // hours
                Text(":")
                TextField("00", text: $minutes) // minutes
                Text(":")
                TextField("00", text: $seconds) // seconds
            }
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
                    saveTimer()
                }) {
                    Image(systemName: "folder")
                    Text("Save")
                }
            }
        }
        .padding()
        .frame(minWidth: 200, maxWidth: 300, minHeight: 175)
        .onExitCommand(perform: { isShown = false })
    }
    
    
    private func saveTimer() {
        guard !name.isEmpty else { return }
        guard !hours.isEmpty || !minutes.isEmpty || !seconds.isEmpty else { return }
        name = name.trimmingCharacters(in: CharacterSet(charactersIn: " ")) // trim leading and trailing whitespace
        handler.timerList.append(TimerModel(name, h: hours, m: minutes, s: seconds)) // add timer
        isShown = false
    }
}

struct NewTimerDialog_Previews: PreviewProvider {
    static var previews: some View {
        NewTimerDialog(isShown: .constant(true))
    }
}
