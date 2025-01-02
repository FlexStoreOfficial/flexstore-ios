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

    func showAlert(title: Text, body: Text, showButtons : Bool = true, showBody : Bool = true, canAnimate: Bool = true) {
        Just(())
            .receive(on: DispatchQueue.main)
            .sink { _ in
                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true)
                self.isAlertPresented = true
                self.alertTitle = title
                self.alertBody = body
                self.showButtons = showButtons
                self.showBody = showBody
                self.canAnimate = canAnimate
                self.showIPADetails = false

            }
            .store(in: &cancellables)
    }
    
    func showIPADetails(id: UUID, canAnimate: Bool = true) {
        Just(())
            .receive(on: DispatchQueue.main)
            .sink { _ in
                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true)
                self.isAlertPresented = true
                self.showIPADetails = true
                self.IPAUUID = id
                self.showButtons = true
                self.canAnimate = canAnimate
            }
            .store(in: &cancellables)
    }
}


struct AlertManager: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AlertManager()
}
