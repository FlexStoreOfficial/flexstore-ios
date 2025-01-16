//
//  RepoCell.swift
//  flexstore-ios
//
//  Created by Krisna Pranav on 16/01/25.
//

import Kingfisher
import SwiftUI
import SwipeActions

struct RepoCell: View {
    @EnvironmentObject var userSettings: UserSettings

    let repo: RepoMemory
    let removeRepos: (Set<UUID>) -> Void

    var body: some View {
        SwipeView {
            HStack {
                let iconSize: CGFloat = userSettings.compactRepoView ? 35 : 48

                if(repo.data.iconURL == nil || repo.data.iconURL == "") {
                    Image("MissingRepo")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                        .clipShape(RoundedRectangle(cornerSize: 25))
                        .padding(.trailing, 7)
                } else {

                }

                VStack(alignment: .leading) {
                    Text(repo.data.name ?? "UNNAMED_REPO")
                    if (!userSettings.compactRepoView) {

                    }
                }

                Spacer()

                VStack(alignment: .center) {
                    Text("\(repo.data.apps.count)")
                        .font(.callout)
                        .foregroundStyle(.gray)
                        .opacity(0.75)
                }
                .padding(.trailing, 15)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
            .background(
                NavigationLink("", destination: SourceView(repo: repo.data))
                    .padding(.trailing, 15)
                    .opacity(0)
            )

            .background(
                Color.white.opacity(0.001)
            )
        }
    }
}
