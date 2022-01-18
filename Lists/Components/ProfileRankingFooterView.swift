//
//  ProfileRankingFooterView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileRankingFooterView: View {
    let comments: [String]
    let associations: [String]
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "bubble.left")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                Text("\(comments.count)")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .offset(y: -2)
            }
            Spacer()
            
            OtherUsersCircleView(associations: associations)
        }
    }
}

struct ProfileRankingFooterView_Previews: PreviewProvider {
    static let comments: [String] = ["No Shot", "True"]
    static let associations: [String] = ["Luke-main", "Yacine-main", "Sam-main"]
    static var previews: some View {
        ProfileRankingFooterView(comments: comments, associations: associations)
    }
}
