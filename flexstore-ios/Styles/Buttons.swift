//
//  Buttons.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 15/01/25.
//

import SwiftUI

public struct AppStoreStyle: ButtonStyle {
    let type: String
    let dissabled: Bool

    public init(type: String, disabled: Bool, extraWidth: CGFloat = 0) {
        self.type = type
        self.dissabled = disabled
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        let (foregroundColor, fill) = colors(forType: type)

        configuration.label
            .font(Font.body.weight(.semibold))
    }
}



private func colors(forType type: String) -> (Color, Color) {
    var foregroundColor: Color
    var fill: Color

    switch type {
    case "blue":
        foregroundColor = Color(.blue)
        fill = Color(.blue).opacity(0.1)
    case "green":
        foregroundColor = Color(.green)
        fill = Color(.green).opacity(0.1)
    case "red":
        foregroundColor = Color(.red)
        fill = Color(.red).opacity(0.1)
    default:
        foregroundColor = Color.accentColor
        fill = Color.gray
    }

    return (foregroundColor, fill)
}
