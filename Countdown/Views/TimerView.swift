//
//  TimerView.swift
//  Countdown
//
//  Created by Pedro Pagán on 10/3/21.
//

import SwiftUI

struct TimerView: View {
    @State var title = "Computer Time"
    var body: some View {
        VStack {
            Text(title).font(.title)
            Divider()
            Circle()
                .shadow(radius: 3, x: 0, y: 0)
        }
        .padding()
        .frame(width: 200, height: 200)
        .fixedSize()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            
    }
}
