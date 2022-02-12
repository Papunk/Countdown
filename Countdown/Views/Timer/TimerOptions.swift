//
//  TimerOptions.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/10/22.
//

import SwiftUI

struct TimerOptions: View {
    var body: some View {
        // Make a ViewBuilder to build rows with the general "Desc - Spacer - Action" format
        List {
            HStack {
                Text("Notification")
                Spacer()
                Toggle(isOn: .constant(true), label: {})
            }
            HStack {
                Text("Reset Automatically")
                Spacer()
                Toggle(isOn: .constant(true), label: {})
            }
            HStack {
                Text("Notification")
                Spacer()
                Toggle(isOn: .constant(true), label: {})
            }
            Button(action: {}) {
                Text("Delete timer").frame(maxWidth: .infinity)
            }
                .foregroundColor(.primary)
                .padding()
                .buttonStyle(.borderless)
                .background(Color.red.opacity(0.8))
                .cornerRadius(10)
        }
    }
}

struct TimerOptions_Previews: PreviewProvider {
    static var previews: some View {
        TimerOptions()
    }
}
