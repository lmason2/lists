//
//  ProfileRankingFooterView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileRankingFooterView: View {
    // MARK: - PROPERTIES
    let comments: [Comment]
    let associations: [String]
    @Binding var expandComment: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                expandComment.toggle()
            }, label: {
                ZStack {
                    Image(systemName: "bubble.left")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    
                    Text("\(comments.count)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .offset(y: -2)
                }
            }) //: BODY
            Spacer()
            
            OtherUsersCircleView(associations: associations)
        } //: HSTACK
    }
}

struct ProfileRankingFooterView_Previews: PreviewProvider {
    static let comments = [
        Comment(username: "lukemason11", content: "Fire"),
        Comment(username: "bhogan9", content: "No way"),
        Comment(username: "yacineguermali", content: "Swap first two"),
        Comment(username: "sam_mccloughan", content: "Agreed")
    ]
    static let associations: [String] = ["Luke-main", "Yacine-main", "Sam-main"]
    @State static var expandComments: Bool = false
    static var previews: some View {
        ProfileRankingFooterView(comments: comments, associations: associations, expandComment: $expandComments)
    }
}
