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
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(profiles) { profile in
                ForEach(profile.posts) { post in
                    LikeableRankingView(profile: profile, image: profile.image, username: profile.id, post: post, displayHeader: $displayHeader)
                        .padding(.horizontal, 5)
                } //: LOOP
            } //: LOOP
        } //: SCROLL
    }
}

struct FeedView_Previews: PreviewProvider {
    @State static var displayHeader: Bool = true
    static var previews: some View {
        FeedView(displayHeader: $displayHeader)
    }
}
