//
//  SettingsView.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/4/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralSettingsPage()
            .tabItem {
                Tab(systemName: "gearshape", text: "General")
            }
            GeneralSettingsPage()
            .tabItem {
                Tab(systemName: "paintbrush", text: "Customization")
            }
            GeneralSettingsPage()
            .tabItem {
                Tab(systemName: "keyboard", text: "Shortcuts")
            }
        }
    }
}

struct Tab: View {
    var systemName: String
    var text: String
    
    var body: some View {
        Image(systemName: systemName)
        Text(text)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
