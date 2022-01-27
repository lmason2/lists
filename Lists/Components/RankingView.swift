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
    @Binding var displayHeader: Bool
    @State var postExpanded: Bool = false
    
    @State var commentsOpen: Bool = false
    let users: [Profile] = Bundle.main.decode("profiles.json")
    
    // MARK: - BODY
    var body: some View {
        if postExpanded {
            ExpandedRankingView(user: user, image: image, username: username, post: post, profile: profile, displayHeader: $displayHeader, expandPost: $postExpanded)
        }
        else {
            MainRankingView(user: user, image: image, username: username, post: post, profile: profile, displayHeader: $displayHeader, postExpanded: $postExpanded)
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    @State static var displayHeader: Bool = true
    static var previews: some View {
        RankingView(user: users[0], image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false, displayHeader: $displayHeader)
    }
}
