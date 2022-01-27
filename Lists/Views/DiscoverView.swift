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
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(discoverProfiles) { profile in
                LikeableRankingView(profile: profile, image: profile.image, username: profile.id, post: profile.posts[0], displayHeader: $displayHeader)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 3)
            } //: LOOP
        } //: SCROLL
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static let discoverProfiles: [Profile] = Bundle.main.decode("discover.json")
    @State static var displayHeader: Bool = true
    
    static var previews: some View {
        DiscoverView(discoverProfiles: discoverProfiles, displayHeader: $displayHeader)
    }
}
