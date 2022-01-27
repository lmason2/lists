//
//  RankingFooterView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingFooterView: View {
    // MARK: - PROPERTIES
    let user: Profile
    let image: String
    let username: String
    let post: Post
    let profiles: [Profile] = Bundle.main.decode("profiles.json")
    @Binding var expandPost: Bool
    @State private var isShowingSheet: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    expandPost.toggle()
                }
            }, label: {
                Image(systemName: "square.stack.3d.up")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }) //: BUTTON
            
            
            if !expandPost {
                ZStack(alignment: .center) {
                    Image(systemName: "bubble.left")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    
                    Text("\(post.comments.count)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .offset(y: -2)
                }
            }
            
            Button(action: {
                isShowingSheet = true
            }, label: {
                Image(systemName: "arrowshape.turn.up.left")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            })
            .sheet(isPresented: $isShowingSheet) {
                FullPostView(user: user, image: image, username: username, post: post, profiles: profiles)
                .background(
                    getGradient(type: post.type)
                )
            }
            Spacer()
            OtherUsersCircleView(associations: post.associations)
        }
        .padding(.top, 5)
    }
}

struct RankingFooterView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    @State static var expandPost: Bool = false
    static var previews: some View {
        RankingFooterView(user: profiles[0], image: profiles[0].image, username: profiles[0].id, post: profiles[0].posts[0], expandPost: $expandPost)
    }
}
