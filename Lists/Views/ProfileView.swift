//
//  ProfileView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - PROPERTIES
    var items: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    let profile: Profile
    @Binding var displayHeader: Bool
    @State var myProfile: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ProfileHeadingView(profile: profile)
            
            let pinned = profile.posts.filter { $0.pinned == true }
            ScrollView(.vertical, showsIndicators: false) {
                if pinned.count != 0 {
                    ForEach(pinned) { post in 
                        RankingView(user: profile, image: profile.image, username: profile.id, post: post, profile: true, discover: false, displayHeader: $displayHeader)
                            .padding(.horizontal, 3)
                    } //: LOOP
                }
                
                LazyVGrid(columns: items, alignment: .center, spacing: 10) {
                      ForEach(profile.posts, id: \.id) { post in
                          if !post.pinned {
                              ProfileRankingView(image: profile.image, username: profile.id, post: post)
                          }
                      } //: LOOP
                } //: LAZYVGRID
            } //: SCROLL
            
            if !myProfile {
                Spacer()
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(
                        LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                    )
            } //: CONDITIONAL
        } //: VSTACK
    }
}

struct ProfileView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    @State static var displayHeader: Bool = false
    static var previews: some View {
        ProfileView(profile: profiles[0], displayHeader: $displayHeader, myProfile: true)
    }
}
