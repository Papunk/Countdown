//
//  ContentView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

struct ContentView: View {
    let window = NSApp.windows.first
    
    var body: some View {
        VStack {
            TimerView(timer: TimerModel("Computer Time", h: 0, m: 30, s: 0))
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
