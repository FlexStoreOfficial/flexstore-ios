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

            if showFullMode {
                let screenshots = app.screenshotURLs ?? []
                if (screenshots.count > 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(screenshots.indices, id: \.self) { index in
                                KFImage(URL(string: screenshots[index]))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
        .background(
            NavigationLink("", destination: TitleContent()).opacity(0)
        )
    }
}
