//
//  FullPostView.swift
//  Lists
//
//  Created by Luke Mason on 1/22/22.
//

import SwiftUI

struct FullPostView: View {
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let profiles: [Profile]
    var commentIndex: UUID?
    
    @State var displayHeader: Bool = false
    @State var expandPost: Bool = true

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            RankingHeaderView(profile: user, image: image, username: username, tags: post.tags, pinned: false, displayHeader: $displayHeader)
                .padding(.horizontal, 3)
                .padding(.vertical, 3)

            FullPostImagesView(rankable: post.ranking)

            FullPostCommentsView(user: user, image: image, username: username, post: post, comments: post.comments, commentIndex: commentIndex)
                .padding(.horizontal, 3)
                .padding(.bottom, 5)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

struct FullPostView_Previews: PreviewProvider {
    static let users: [Profile] = Bundle.main.decode("profile.json")
    static var previews: some View {
        FullPostView(user: users[0], image: users[0].image, username: users[0].id, post: users[0].posts[0], profiles: users, commentIndex: UUID())
    }
}
