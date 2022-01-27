//
//  MainDiscoverRankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct MainRankingView: View {
    // MARK: - PROPERTIES
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let profile: Bool
    @Binding var displayHeader: Bool
    @Binding var postExpanded: Bool
    
    let users: [Profile] = Bundle.main.decode("profiles.json")
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // Profile and Tags
            RankingHeaderView(profile: user, image: image, username: username, tags: post.tags, pinned: profile ? post.pinned : false, displayHeader: $displayHeader)
            
            // Ranking images
            RankingImagesView(rankable: post.ranking)
                
            // Footer comments and users
            RankingFooterView(user: user, image: image, username: username, post: post, expandPost: $postExpanded)
        } //: VSTACK

        .padding(.horizontal, 10)
        .padding(.vertical, 3)
        .cornerRadius(10)
        .background(
            profile ? Color.clear.frame(width: 3).offset(x: (-(UIScreen.main.bounds.width/2) + 30)) : Color.white.frame(width: 3).offset(x: (-(UIScreen.main.bounds.width/2) + 30))
        )
    }
}

struct MainDiscoverRankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    @State static var displayHeader: Bool = true
    @State static var postExpanded: Bool = false
    static var previews: some View {
        MainRankingView(user: users[0], image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false, displayHeader: $displayHeader, postExpanded: $postExpanded)
    }
}
