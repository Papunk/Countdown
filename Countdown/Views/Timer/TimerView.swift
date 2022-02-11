//
//  TimerView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI
import Combine

struct TimerView: View {
    @ObservedObject var timer: TimerModel
    @Binding var clock: Publishers.Autoconnect<Timer.TimerPublisher>

    var body: some View {
        if let name = timer.name {
            VStack(alignment: .leading) {
                HStack {
                    Text(name).font(.system(size: 30, weight: .bold,  design: .default))
                    Spacer()
                    // TODO make a struct for this type of button
                    Group {
                        // TODO make this button look disabled when it has to
                        Button(action: { timer.reset() }, label: {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.system(size: 14, weight: .heavy))
                                .frame(width: 10, height: 10)
                                .padding()
                        })
                            .disabled(!timer.isActive)
                            .background(Color.secondary.opacity(0.5))
                        Button(action: { timer.isActive.toggle() }, label: {
                            Text(timer.isActive ? "Pause" : "Start").fontWeight(.semibold)
                                .frame(width: 40, height: 10)
                                .padding()
                        })

                            .background(timer.isActive ? .red.opacity(0.8) : .blue.opacity(0.8))
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                }
                Divider()
                Text(timer.format()).font(.system(size: 24, design: .monospaced))
                TabView {
                    TimerHistory().tabItem({ Text("Log") })
                    TimerOptions().tabItem({ Text("Options") })
                }
                .environmentObject(timer)
            }
            .padding()
        }
        else {
            Text("Timer deleted. Undo?").foregroundColor(.secondary)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timer: TimerModel(), clock: .constant(Timer.publish(every: 1, on: .main, in: .common).autoconnect()))
    }
}
