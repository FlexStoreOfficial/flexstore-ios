//
//  AppCell.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 16/01/25.
//

import SwiftUI
import Kingfisher

struct AppCell: View {
    let app: Application
    let showFullMode: Bool

    var body: some View {
        let version = (app.versions?[0].version != nil && app.versions?[0].version != "" ? (app.versions?[0].version ?? "") : "")

        VStack(alignment: .leading) {
            HStack {
                if (app.iconURL != "") {
                    KFImage(URL(string: app.iconURL)).resizable().frame(width: 48, height: 48).padding(.trailing, 7)
                } else {
                    Image("MissingApp")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .padding(.trailing, 7)
                }
            }
        }
    }
}
