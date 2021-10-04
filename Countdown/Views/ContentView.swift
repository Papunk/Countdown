//
//  ContentView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var hasPicked = false
    @State var h = ""
    @State var m = ""
    @State var s = ""
    @State var text = ""
    
    var body: some View {
        if hasPicked {
            TimerView(timer: TimerModel(text, h: UInt8(h)!, m: UInt8(m)!, s: UInt8(s)!))
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
