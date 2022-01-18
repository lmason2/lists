//
//  CommentListView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct CommentListView: View {
    // MARK: - PROPERTIES
    let comment: Comment
    let profile: Profile
    @State private var liked: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(profile.image)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 1))
                .frame(width: 20, height: 20)
            Text(comment.content)
                .foregroundColor(.black)
                .font(.system(size: 15, weight: .medium, design: .rounded))
            Spacer()
            Image(systemName: liked ? "hand.thumbsup.fill" : "hand.thumbsup")
                .onTapGesture {
                    liked.toggle()
                } //: GESTURE
                .padding(.trailing, 10)
        } //: HSTACK
    }
}

struct CommentListView_Previews: PreviewProvider {
    static let comment: Comment = Comment(username: "lukemason11", content: "Fire")
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    static var previews: some View {
        CommentListView(comment: comment, profile: profiles[0])
    }
}
