//
//  CommentsView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct CommentsView: View {
    let comments: [Comment]
    let profiles: [Profile]
    var body: some View {
        VStack (alignment: .leading) {
            ForEach(comments) { comment in
                Divider()
                CommentListView(comment: comment, profile: profiles.first(where: { $0.id == comment.username })!)
            }
        }
        .frame(maxWidth: 680)
        .padding(.bottom, 5)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static let comments = [
        Comment(username: "lukemason11", content: "Fire"),
        Comment(username: "bhogan9", content: "No way"),
        Comment(username: "yacineguermali", content: "Swap first two"),
        Comment(username: "sam_mccloughan", content: "Agreed")
    ]
    static let profiles: [Profile] = Bundle.main.decode("profile.json")
    static var previews: some View {
        CommentsView(comments: comments, profiles: profiles)
    }
}
