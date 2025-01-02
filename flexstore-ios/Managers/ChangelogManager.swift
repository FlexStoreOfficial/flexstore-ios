//
//  ChangelogManager.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 02/01/25.
//

import SwiftUI
import BottomSheet

struct ListItem: Hashable {
    var icon: String
    var text: String
    var subtext: String
    var color: Color
}

struct ChangelogManagerView<Content: View>: View {
    @State private var bottomSheetPosition: BottomSheetPosition = .hidden
    @State private var page: Int32 = 0
    @Environment(\.openURL) var openURL
    
    
    
    struct ChangelogManager: View {
        var body: some View {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }

}
