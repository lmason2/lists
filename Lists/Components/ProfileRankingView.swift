//
//  ProfileRankingView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileRankingView: View {
    // MARK: - PROPERTIES
    let image: String
    let username: String
    let post: Post
    @State var expandComments: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            ProfileRankingHeaderView(image: image, username: username)
            
            ProfileRankingImageView(image: post.ranking[0].image, tags: post.tags)
            
            ProfileRankingFooterView(comments: post.comments, associations: post.associations, expandComment: $expandComments)
        } //: VSTACK
        .frame(width: UIScreen.main.bounds.width * 0.45)
        .padding(.vertical, 5)
        .padding(.horizontal, 3)
        .background(
            getGradient(type: post.type)
        )
        .cornerRadius(5)
        
    }
}

struct ProfileRankingView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    
    static var previews: some View {
        ProfileRankingView(image: profiles[0].image, username: profiles[0].id, post: profiles[0].posts[0])
    }
}
