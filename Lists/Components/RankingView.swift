//
//  RankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingView: View {
    // MARK: - PROPERTIES
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let profile: Bool
    let discover: Bool
    @Binding var displayHeader: Bool
    @Binding var postExpanded: Bool
    @State var expand: Bool = false
    @Binding var feedExpanded: Bool
    
    @State var commentsOpen: Bool = false
    let users: [Profile] = Bundle.main.decode("profiles.json")
    
    // MARK: - BODY
    var body: some View {
        if discover {
            if expand {
                ExpandedMainDiscoverRankingView(user: user, image: image, username: username, post: post, profile: profile, displayHeader: $displayHeader, postExpanded: $postExpanded, expand: $expand, feedExpanded: $feedExpanded)
            }
            else {
                MainDiscoverRankingView(user: user, image: image, username: username, post: post, profile: profile, commentsOpen: $commentsOpen, displayHeader: $displayHeader, postExpanded: $postExpanded, expand: $expand, feedExpanded: $feedExpanded)
            }
        }
        else {
            if expand {
                ExpandedMainFeedRankingView(user: user, image: image, username: username, post: post, profile: profile, displayHeader: $displayHeader, expand: $expand, feedExpanded: $feedExpanded)
            }
            else {
                MainFeedRankingView(user: user, image: image, username: username, post: post, profile: profile, commentsOpen: $commentsOpen, displayHeader: $displayHeader, postExpanded: $postExpanded, expand: $expand, feedExpanded: $feedExpanded)
            }
            
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    @State static var displayHeader: Bool = true
    @State static var postExpanded: Bool = false
    @State static var feedExpanded: Bool = true
    static var previews: some View {
        RankingView(user: users[0], image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false, discover: true, displayHeader: $displayHeader, postExpanded: $postExpanded, expand: false, feedExpanded: $feedExpanded)
    }
}
