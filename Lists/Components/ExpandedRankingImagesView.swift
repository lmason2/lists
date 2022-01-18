//
//  ExpandedRankingImagesView.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import SwiftUI

struct ExpandedRankingImagesView: View {
    let rankable: [Rankable]
    let discover: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                ForEach(rankable.prefix(3)) { data in
                    RankableSingleImageView(data: data, topThree: true)
                } //: LOOP
            }
            if rankable.count > 3 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(3..<rankable.count) { index in
                            RankableSingleImageView(data: rankable[index], topThree: false)
                        }
                    }
                }
            }
            
        }
    }
}

struct ExpandedRankingImagesView_Previews: PreviewProvider {
    static let artists: [Rankable] = [Rankable(image: "drake", basicInfo: "Drake"), Rankable(image: "jcole", basicInfo: "J. Cole"), Rankable(image: "vince", basicInfo: "Vince Staples"), Rankable(image: "kanye", basicInfo: "Kanye West"), Rankable(image: "mac", basicInfo: "Mac Miller")]
    static let discover: Bool = false
    static var previews: some View {
        ExpandedRankingImagesView(rankable: artists, discover: discover)
    }
}
