//
//  AlertManager.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 02/01/25.
//

import SwiftUI
import Combine

struct ErrorMessage: Hashable {
    var title: String
    var body: String
}

struct FunctionStatus: Hashable {
    var error: Bool
    var message: ErrorMessage?
}

class AlertManager: ObservableObject {
    @Published var isAlertPresented = false
    @Published var alertTitle = Text("")
    @Published var alertBody = Text("")
    @Published var showButtons = true
    @Published var showBody = true
    @Published var canAnimate = true
    @Published var showIPADetails = true
    @Published var IPAUUID = UUID()
    
    private var cancellables: Set<AnyCancellable> = []
}

struct AlertManager: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AlertManager()
}
