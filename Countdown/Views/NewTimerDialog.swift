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
    @Environment(\.managedObjectContext) var context

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
        .onSubmit({ saveTimer() })
    }
    
    private func saveTimer() {
        // validation
        guard !name.isEmpty else { return }
        guard !hours.isEmpty || !minutes.isEmpty || !seconds.isEmpty else { return }
        // storing values
        let timer = TimerModel(context: context)
        name = name.trimmingCharacters(in: CharacterSet(charactersIn: " ")) // trim leading and trailing whitespace
        let time = TimerModel.getAbsoluteTime(h: hours, m: minutes, s: seconds)
        TimerModel.fill(object: timer, name: name, duration: time)
        try? context.save()
        isShown = false
    }
}

struct NewTimerDialog_Previews: PreviewProvider {
    static var previews: some View {
        NewTimerDialog(isShown: .constant(true))
    }
}
