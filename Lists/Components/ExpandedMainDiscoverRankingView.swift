//
//  ExpandedMainDiscoverRankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct ExpandedMainDiscoverRankingView: View {
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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ExpandedMainDiscoverRankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    @State static var displayHeader: Bool = true
    @State static var commentsOpen: Bool = true
    @State static var postExpanded: Bool = true
    static var previews: some View {
        ExpandedMainDiscoverRankingView(user: users[0], image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false, commentsOpen: $commentsOpen, displayHeader: $displayHeader, postExpanded: $postExpanded)
    }
}
