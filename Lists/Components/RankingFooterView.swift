//
//  RankingFooterView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingFooterView: View {
    // MARK: - PROPERTIES
    let comments: [Comment]
    let associations: [String]
    @Binding var expandComment: Bool
    @Binding var expandPost: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                print("expanding")
                withAnimation {
                    expandPost.toggle()
                }
            }, label: {
                Image(systemName: "square.stack.3d.up")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }) //: BUTTON
            
            
            Button(action: {
                withAnimation {
                    expandComment.toggle()
                }
            }, label: {
                ZStack(alignment: .center) {
                    Image(systemName: "bubble.left")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    
                    Text("\(comments.count)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .offset(y: -2)
                }
            }) //: BUTTON
            Spacer()
            OtherUsersCircleView(associations: associations)
        }
        .padding(.top, 5)
    }
}

struct RankingFooterView_Previews: PreviewProvider {
    static let comments = [
        Comment(username: "lukemason11", content: "Fire"),
        Comment(username: "bhogan9", content: "No way"),
        Comment(username: "yacineguermali", content: "Swap first two"),
        Comment(username: "sam_mccloughan", content: "Agreed")
    ]
    static let associations = ["Luke-main", "Yacine-main", "Ben-main"]
    @State static var expandComments: Bool = false
    @State static var expandPost: Bool = false
    static var previews: some View {
        RankingFooterView(comments: comments, associations: associations, expandComment: $expandComments, expandPost: $expandPost)
    }
}
