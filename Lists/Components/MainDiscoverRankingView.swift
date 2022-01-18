//
//  MainDiscoverRankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct MainDiscoverRankingView: View {
    // MARK: - PROPERTIES
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let profile: Bool
    @Binding var commentsOpen: Bool
    @Binding var displayHeader: Bool
    @Binding var postExpanded: Bool
    let users: [Profile] = Bundle.main.decode("profiles.json")
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // Profile and Tags
            RankingHeaderView(profile: user, image: image, username: username, tags: post.tags, pinned: profile ? post.pinned : false, displayHeader: $displayHeader)
            
            // Ranking images
            RankingImagesView(rankable: post.ranking, discover: true)
            
            if commentsOpen {
                // Footer comments and users
                RankingFooterView(comments: post.comments, associations: post.associations, expandComment: $commentsOpen, expandPost: $postExpanded)
                CommentsView(comments: post.comments, profiles: users)
            }
            
            else {
                // Footer comments and users
                RankingFooterView(comments: post.comments, associations: post.associations, expandComment: $commentsOpen, expandPost: $postExpanded)
            }
        } //: VSTACK
        .transition(.scale)
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
        .background(
            Color.white.frame(width: 3).offset(x: (-(UIScreen.main.bounds.width/2) + 30))
        )
        .cornerRadius(5)
    }
}

struct MainDiscoverRankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    @State static var displayHeader: Bool = true
    @State static var commentsOpen: Bool = false
    @State static var postExpanded: Bool = false
    static var previews: some View {
        MainDiscoverRankingView(user: users[0], image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false, commentsOpen: $commentsOpen, displayHeader: $displayHeader, postExpanded: $postExpanded)
    }
}
