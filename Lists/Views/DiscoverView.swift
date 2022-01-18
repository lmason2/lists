//
//  DiscoverView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct DiscoverView: View {
    // MARK: - PROPERTIES
    let discoverProfiles: [Profile]
    @Binding var displayHeader: Bool
    @State var postExpanded: Bool = false
    @Binding var feedExpanded: Bool
    @Binding var discoverExpanded: Bool
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(discoverProfiles) { profile in
                DiscoverRankingView(profile: profile, image: profile.image, username: profile.id, post: profile.posts[0], displayHeader: $displayHeader, postExpanded: $postExpanded, feedExpanded: $feedExpanded, discoverExpanded: $discoverExpanded)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 3)
            } //: LOOP
        } //: SCROLL
        .disabled(postExpanded)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static let discoverProfiles: [Profile] = Bundle.main.decode("discover.json")
    @State static var displayHeader: Bool = true
    @State static var feedExpanded: Bool = true
    @State static var discoverExpanded: Bool = true
    
    static var previews: some View {
        DiscoverView(discoverProfiles: discoverProfiles, displayHeader: $displayHeader, feedExpanded: $feedExpanded, discoverExpanded: $discoverExpanded)
    }
}
