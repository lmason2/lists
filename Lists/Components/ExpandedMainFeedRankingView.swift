//
//  ExpandedMainFeedRankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct ExpandedMainFeedRankingView: View {
    // MARK: - PROPERTIES
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let profile: Bool
    @Binding var displayHeader: Bool
    @Binding var expand: Bool
    @Binding var feedExpanded: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // Profile and Tags
            RankingHeaderView(profile: user, image: image, username: username, tags: post.tags, pinned: profile ? post.pinned : false, displayHeader: $displayHeader)
            
            if feedExpanded {
                Text("Testing")
            }
            
        } //: VSTACK
        .transition(.scale)
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
        .background(
            getGradient(type: post.type)
        )
        .cornerRadius(5)
    }
}

struct ExpandedMainFeedRankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    @State static var displayHeader: Bool = true
    @State static var expand: Bool = false
    @State static var feedExpanded: Bool = true
    static var previews: some View {
        ExpandedMainFeedRankingView(user: users[0], image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false, displayHeader: $displayHeader, expand: $expand, feedExpanded: $feedExpanded)
    }
}
