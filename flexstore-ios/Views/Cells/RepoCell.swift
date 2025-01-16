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
            }
        }
    }
}
