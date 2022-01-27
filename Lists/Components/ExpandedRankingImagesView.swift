//
//  ExpandedRankingImagesView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct ExpandedRankingImagesView: View {
    var items: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let rankable: [Rankable]
    let discover: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<((rankable.count - 1) / 3) + 1) { i in
                HStack(alignment: .top, spacing: 5) {
                    ForEach(0..<3) {j in
                        if (((i * 3) + j) < (rankable.count)) {
                            RankableSingleImageView(data: rankable[(i * 3) + j], fullPost: false)
                        }
                    }
                }
            }
        }
        .frame(height: rankable.count < 4 ? 125 : 225)
    }
}

struct ExpandedRankingImagesView_Previews: PreviewProvider {
    static let artists: [Rankable] = [Rankable(image: "drake", basicInfo: "Drake"), Rankable(image: "jcole", basicInfo: "J. Cole"), Rankable(image: "vince", basicInfo: "Vince Staples"), Rankable(image: "kanye", basicInfo: "Kanye West"), Rankable(image: "mac", basicInfo: "Mac Miller")]
    static let discover: Bool = false
    static var previews: some View {
        ExpandedRankingImagesView(rankable: artists, discover: discover)
    }
}
