//
//  RankingFooterView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingFooterView: View {
    let comments: [String]
    let associations: [String]
    var body: some View {
        HStack {
            Image(systemName: "square.stack.3d.up")
                .foregroundColor(.white)
                .font(.system(size: 25))
            
            ZStack(alignment: .center) {
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
        .padding(.top, 5)
    }
}

struct RankingFooterView_Previews: PreviewProvider {
    static let comments = ["Fire", "No way", "Swap first two", "Agreed"]
    static let associations = ["Luke-main", "Yacine-main", "Ben-main"]
    static var previews: some View {
        RankingFooterView(comments: comments, associations: associations)
    }
}
