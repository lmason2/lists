//
//  DiscoverView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct DiscoverView: View {
    let discoverProfiles: [Profile]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(discoverProfiles) { profile in
                DiscoverRankingView(image: profile.image, username: profile.id, post: profile.posts[0])
                    .padding(.horizontal, 5)
                    .padding(.bottom, 3)
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static let discoverProfiles: [Profile] = Bundle.main.decode("discover.json")
    
    static var previews: some View {
        DiscoverView(discoverProfiles: discoverProfiles)
    }
}
