/**
 * @file Extensions.swift
 * @author Krisna Pranav
 * @brief Extensions
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */

import SwiftUI

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    } // init
} // extension Color

