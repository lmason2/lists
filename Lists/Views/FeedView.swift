//
//  FeedView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct FeedView: View {
    let profiles: [Profile] = Bundle.main.decode("profiles.json")
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(profiles) { profile in
                RankingView(image: profile.image, username: profile.id, post: profile.posts[0], profile: false)
                    .padding(.horizontal, 5)
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
