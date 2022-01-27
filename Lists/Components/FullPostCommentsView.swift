//
//  FullPostCommentsView.swift
//  Lists
//
//  Created by Luke Mason on 1/22/22.
//

import SwiftUI

struct FullPostCommentsView: View {
    let user: Profile
    let image: String
    let username: String
    let post: Post
    @State var comments: [Comment]
    let profiles: [Profile] = Bundle.main.decode("profiles.json")
    var commentIndex: UUID?
    @State private var newComment: String = ""
    @FocusState var postCommentIsFocused: Field?
    var body: some View {
        VStack {
            Divider()
            HStack {
                TextField("Comment", text: $newComment)
                .focused($postCommentIsFocused, equals: .match)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .border(Color.white, width: 2)
                .cornerRadius(2)
                .task {
                    self.postCommentIsFocused = .match
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        comments.insert(Comment(username: "bhogan9", content: newComment, likes: 0), at: 0)
                    }
                    newComment = ""
                    postCommentIsFocused = .mismatch
                }, label: {
                    Image(systemName: "plus.bubble")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                })
            }

            ForEach(comments) { comment in
                Divider()
                    .padding(.trailing, 10)
                CommentListView(user: user, image: image, username: username, post: post, comment: comment, profile: profiles.first(where: { $0.id == comment.username })!, commentIndex: commentIndex, fullPost: true)
                    .padding(.trailing, 10)
            } //: LOOP
        } //: VSTACK
    }
}

struct FullPostCommentsView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    static var previews: some View {
        FullPostCommentsView(user: profiles[0], image: profiles[0].image, username: profiles[0].id, post: profiles[0].posts[0], comments: profiles[0].posts[0].comments, commentIndex: UUID())
    }
}
