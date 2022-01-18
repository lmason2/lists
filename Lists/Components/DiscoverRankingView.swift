//
//  DiscoverRankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct DiscoverRankingView: View {
    let image: String
    let username: String
    let post: Post
    
    var body: some View {
        HStack(spacing: 0) {
            LikeCounter()
            RankingView(image: image, username: username, post: post, profile: false, discover: true)
        }
        .background(
            getGradient(type: post.type)
        )
        .cornerRadius(10)
    }
}

struct DiscoverRankingView_Previews: PreviewProvider {
    static let discoverUsers: [Profile] = Bundle.main.decode("discover.json")
    static var previews: some View {
        DiscoverRankingView(image: discoverUsers[0].image, username: discoverUsers[0].id, post: discoverUsers[0].posts[0])
    }
}
