//
//  UninstallManager.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 05/01/25.
//

import SwiftUI
import Foundation

class UserSettings: ObservableObject {
    @AppStorage("reduced_motion") var reducedMotion : Bool = true
    @AppStorage("blur_strength") var blurStrength: Double = 10
    @AppStorage("compact_repo_view") var compactRepoView: Bool = false
    @AppStorage("lang") var lang : String = ""
    @AppStorage("add_repo_keyboard_type") var addRepoKeyboardType : UIKeyboardType = .URL
    @AppStorage("has_seen_discord") var hasSeenDiscord : Bool = false
    @AppStorage("skip_install_prompt") var skipInstallPrompt : Bool = true
}
