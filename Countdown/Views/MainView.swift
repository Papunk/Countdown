//
//  ContentView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

struct MainView: View {
    @State var hasPicked = false
    @State var h = ""
    @State var m = ""
    @State var s = ""
    @State var text = ""
    
    var body: some View {
        Group {
            if hasPicked {
                TimerView(timer: TimerModel(text.isEmpty ? "Timer" : text, h: UInt8(h) ?? 0, m: UInt8(m) ?? 0, s: UInt8(s) ?? 0))
            }
            else {
                VStack {
                    TextField("Enter name", text: $text)
                    TextField("Enter hours", text: $h)
                    TextField("Enter minutes", text: $m)
                    TextField("Enter seconds", text: $s)
                    Button(action: {
                        hasPicked.toggle()
                    }, label: {
                        Image(systemName: "play")
                    })
                }
                .padding()
            }
        }
        .frame(width: 200, height: 150)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
