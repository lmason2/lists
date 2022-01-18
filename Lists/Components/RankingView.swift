//
//  RankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingView: View {
    let image: String
    let username: String
    let post: Post
    let profile: Bool
    let discover: Bool
    
    var body: some View {
        if discover {
            VStack {
                // Profile and Tags
                RankingHeaderView(image: image, username: username, tags: post.tags, pinned: profile ? post.pinned : false)
                
                // Ranking images
                RankingImagesView(rankable: post.ranking)
                
                // Footer comments and users
                RankingFooterView(comments: post.comments, associations: post.associations)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 3)
            .background(
                Color.white.frame(width: 3).offset(x: (-(UIScreen.main.bounds.width/2) + 30))
            )
            .cornerRadius(5)
        }
        else {
            VStack {
                // Profile and Tags
                RankingHeaderView(image: image, username: username, tags: post.tags, pinned: profile ? post.pinned : false)
                
                // Ranking images
                RankingImagesView(rankable: post.ranking)
                
                // Footer comments and users
                RankingFooterView(comments: post.comments, associations: post.associations)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 3)
            .background(
                getGradient(type: post.type)
            )
            .cornerRadius(5)
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    
    static var previews: some View {
        RankingView(image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false, discover: true)
    }
}
