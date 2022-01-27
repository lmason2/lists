//
//  CommentsView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct CommentsView: View {
    // MARK: - PROPERTIES
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let comments: [Comment]
    let profiles: [Profile]
    let expanded: Bool
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(comments) { comment in
                Divider()
                    .padding(.trailing, 10)
                CommentListView(user: user, image: image, username: username, post: post, comment: comment, profile: profiles.first(where: { $0.id == comment.username })!, fullPost: false)
                    .padding(.trailing, 10)
            } //: LOOP
        } //: SCROLL
        .frame(maxWidth: 680, maxHeight: expanded ? 150 : 200)
        .padding(.bottom, 5)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static let comments = [
        Comment(username: "lukemason11", content: "Fire", likes: 0),
        Comment(username: "bhogan9", content: "No way", likes: 0),
        Comment(username: "yacineguermali", content: "Swap first two", likes: 0),
        Comment(username: "sam_mccloughan", content: "Agreed", likes: 0)
    ]
    static let profiles: [Profile] = Bundle.main.decode("profile.json")
    @State static var expanded: Bool = true
    static var previews: some View {
        CommentsView(user: profiles[0], image: profiles[0].image, username: profiles[0].id, post: profiles[0].posts[0], comments: profiles[0].posts[0].comments, profiles: profiles, expanded: expanded)
    }
}
