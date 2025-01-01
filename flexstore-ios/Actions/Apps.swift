/**
 * @file Apps.swift
 * @author Krisna Pranav
 * @brief Apps
 * @version 1.0
 * @date 2024-11-25
 *
 * @copyright Copyright (c) 2024 FlexStore Developers, Krisna Pranav
 *
 */

import Foundation
import Combine

struct BundledApp: Identifiable, Hashable {
    let id: String
    var name: String
    var version: String
    var isStore: Bool
    var icon: UIImage
}

private func applicationIconImage() -> Int32 {
    return UIDevice.current.userInterfaceIdiom == .pad ? 8 : 10
}

func GetApps() -> [BundledApp] {
    var apps: [BundledApp] = []
    
}
