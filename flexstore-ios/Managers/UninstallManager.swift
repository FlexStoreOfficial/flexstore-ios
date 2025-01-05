//
//  UninstallManager.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 05/01/25.
//

import SwiftUI
import Combine

func UninstallIPA(_ appID: String) -> FunctionStatus {
    if let storeApp = SBFApplication(applicationBundleIdentifier: "com.opa334.TrollStore") {
        let trollStoreHelperPath = storeApp.bundleURL.path + "/trollstorehelper"
        let returnCode = spawnRoot(trollStoreHelperPath, ["uninstall", appID])
        
        if (returnCode != 0) {
            return FunctionStatus(error: true, message: ErrorMessage(title: "FAILED TO INSTALL", body: "UNINSTALLATION RETURNED ERROR \(returnCode)"))
        } else {
            NotificationCenter.default.post(name: Notification.Name("ApplicationChanged"), object: nil)
        }
    }
}
