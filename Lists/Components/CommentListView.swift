//
//  CommentListView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct CommentListView: View {
    // MARK: - PROPERTIES
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let profiles: [Profile] = Bundle.main.decode("profiles.json")
    let comment: Comment
    let profile: Profile
    @State var commentIndex: UUID?
    @State var fullPost: Bool
    @State private var liked: Bool = false
    @State private var isShowingSheet: Bool = false
    @State private var commentReply: Bool = false
    @State private var newComment: String = ""
    @State private var index: String = "testing"
    @FocusState private var focusedField: Field?
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(profile.image)
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 1))
                    .frame(width: 20, height: 20)
                Text(comment.content)
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .light, design: .rounded))
                    .multilineTextAlignment(.leading)
                Spacer()
                HorizontalLikeCounter(likeCount: comment.likes)
                Button(action: {
                    if fullPost {
                        if commentIndex != nil {
                            withAnimation{
                                commentReply = false
                                commentIndex = nil
                            }
                        }
                        else {
                            withAnimation{
                                commentReply.toggle()
                            }
                        }
                    }
                    else {
                        isShowingSheet = true
                    }
                }, label: {
                    Image(systemName: "arrowshape.turn.up.left")
                        .foregroundColor(.white)
                })
                .sheet(isPresented: $isShowingSheet) {
                    FullPostView(user: user, image: image, username: username, post: post, profiles: profiles, commentIndex: comment.id)
                    .background(
                        getGradient(type: post.type)
                    )
                }
            } //: HSTACK
            if commentReply || commentIndex == comment.id {
                HStack {
                    TextField("Reply", text: $newComment)
                    .focused($focusedField, equals: .match)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .border(Color.white, width: 2)
                    .cornerRadius(2)
                    .task {
                        self.focusedField = .match
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            commentReply = false
                            commentIndex = nil
                        }
                    }, label: {
                        Image(systemName: "plus.bubble")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    })
                }
                
            }
        }
        .transition(.slide)
    }
}
