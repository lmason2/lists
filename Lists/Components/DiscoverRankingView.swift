//
//  DiscoverRankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct DiscoverRankingView: View {
    // MARK: - PROPERTIES
    let profile: Profile
    let image: String
    let username: String
    let post: Post
    @Binding var displayHeader: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 0) {
            LikeCounter()
            RankingView(user: profile, image: image, username: username, post: post, profile: false, discover: true, displayHeader: $displayHeader)
        } //: HSTACK
        .background(
            getGradient(type: post.type)
        )
        .cornerRadius(10)
    }
}

struct DiscoverRankingView_Previews: PreviewProvider {
    static let discoverUsers: [Profile] = Bundle.main.decode("discover.json")
    @State static var displayHeader: Bool = true
    static var previews: some View {
        DiscoverRankingView(profile: discoverUsers[0], image: discoverUsers[0].image, username: discoverUsers[0].id, post: discoverUsers[0].posts[0], displayHeader: $displayHeader)
    }
}
