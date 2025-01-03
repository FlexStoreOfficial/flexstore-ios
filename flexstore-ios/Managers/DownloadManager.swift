//
//  DownloadManager.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 03/01/25.
//

import Foundation
import SwiftUI

class DownloadDelegate: NSObject, ObservableObject, URLSessionDownloadDelegate {
    var queueItem: QueueItem
    var completion: (FunctionStatus) -> Void
    var queueManager: QueueManager
    
    init(queueItem: QueueItem, completion: @escaping (FunctionStatus) -> Void, queueManager: QueueManager) {
        self.queueItem = queueItem
        self.completion = completion
        self.queueManager = queueManager
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?) {
        do {
            
        } catch {
            print(error)
        }
    }
}
