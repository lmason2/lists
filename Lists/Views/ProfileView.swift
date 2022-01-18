//
//  ProfileView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileView: View {
    var items: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    let profile: Profile
    var body: some View {
        VStack {
            ProfileHeadingView(profile: profile)
            
            let pinned = profile.posts.filter { $0.pinned == true }
            ScrollView(.vertical, showsIndicators: false) {
                if pinned.count != 0 {
                    ForEach(pinned) { post in 
                        RankingView(image: profile.image, username: profile.id, post: post, profile: true, discover: false)
                            .padding(.horizontal, 3)
                    }
                }
                LazyVGrid(columns: items, alignment: .center, spacing: 10) {
                      ForEach(profile.posts, id: \.id) { post in
                          if !post.pinned {
                              ProfileRankingView(image: profile.image, username: profile.id, post: post)
                          }
                      }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    static var previews: some View {
        ProfileView(profile: profiles[0])
    }
}
