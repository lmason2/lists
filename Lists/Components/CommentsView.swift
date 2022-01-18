//
//  CommentsView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct CommentsView: View {
    // MARK: - PROPERTIES
    let comments: [Comment]
    let profiles: [Profile]
    let expanded: Bool
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(comments) { comment in
                Divider()
                    .padding(.trailing, 10)
                CommentListView(comment: comment, profile: profiles.first(where: { $0.id == comment.username })!, expanded: expanded)
            } //: LOOP
        } //: SCROLL
        .frame(maxWidth: 680, maxHeight: expanded ? 150 : 200)
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
        CommentsView(comments: comments, profiles: profiles, expanded: false)
    }
}
