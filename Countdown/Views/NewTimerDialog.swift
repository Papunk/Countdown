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
                Button(action: {
                    // clear the current timer and
                    isShown = false
                }) {
                    Image(systemName: "trash")
                    Text("Cancel")
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "folder")
                    Text("Save")
                }
            }
        }
        .padding()
        .frame(minWidth: 175, minHeight: 175)
    }
}

struct NewTimerDialog_Previews: PreviewProvider {
    static var previews: some View {
        NewTimerDialog(isShown: .constant(true))
    }
}
