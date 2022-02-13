//
//  CustomButton.swift
//  Countdown
//
//  Created by Pedro Pagán on 2/12/22.
//

import SwiftUI

/**
 A custom template for buttons throughout the application
 */
struct CustomButton<Content: View>: View {
    
    var width: CGFloat
    var height: CGFloat
    var extendHorizontally: Bool
    var color: Color
    var opacity: Double
    var action: () -> Void
    var content: Content

    
    init(width: CGFloat, height: CGFloat? = nil, extendHorizontally: Bool = false, color: Color, opacity: Double = 1, action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.width = width
        self.height = height ?? width
        self.extendHorizontally = extendHorizontally
        self.color = color
        self.opacity = opacity
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        Button(action: action, label: {
            content
                .frame(width: width, height: height)
                .frame(maxWidth: extendHorizontally ? .infinity : width)
                .padding()
        })
            .background(color.opacity(opacity))
            .buttonStyle(.borderless)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(width: 40, height: 20, color: .blue, action: {}) {
            Text("Hello")
        }
    }
}
