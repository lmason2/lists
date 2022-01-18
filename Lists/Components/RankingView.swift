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
    
    var body: some View {
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
            (post.type == .music) ? LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.red.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing) :
                (post.type == .movie) ? LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.pink.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing) :
                (post.type == .food) ? LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.5), Color.orange.opacity(1)]), startPoint: .topLeading, endPoint: .bottomTrailing) :
                LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.7), Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(5)
    }
}

struct RankingView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    
    static var previews: some View {
        RankingView(image: users[0].image, username: users[0].id, post: users[0].posts[0], profile: false)
    }
}
