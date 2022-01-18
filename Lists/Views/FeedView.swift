//
//  FeedView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct FeedView: View {
    // MARK: - PROPERTIES
    let profiles: [Profile] = Bundle.main.decode("profiles.json")
    @Binding var displayHeader: Bool
    @State var postExpanded: Bool = false
    @Binding var feedExpanded: Bool
    @Binding var discoverExpanded: Bool
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(profiles) { profile in
                ForEach(profile.posts) { post in
                    RankingView(user: profile, image: profile.image, username: profile.id, post: post, profile: false, discover: false, displayHeader: $displayHeader, postExpanded: $postExpanded, feedExpanded: $feedExpanded, discoverExpanded: $discoverExpanded)
                        .padding(.horizontal, 5)
                } //: LOOP
            } //: LOOP
        } //: SCROLL
    }
}

struct FeedView_Previews: PreviewProvider {
    @State static var displayHeader: Bool = true
    @State static var feedExpanded: Bool = true
    @State static var discoverExpanded: Bool = true
    static var previews: some View {
        FeedView(displayHeader: $displayHeader, feedExpanded: $feedExpanded, discoverExpanded: $discoverExpanded)
    }
}
