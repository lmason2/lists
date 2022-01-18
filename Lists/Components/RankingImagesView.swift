//
//  RankingImagesView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingImagesView: View {
    // MARK: - PROPERTIES
    let rankable: [Rankable]
    let discover: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            ForEach(rankable.prefix(discover ? 3 : 5)) { data in
                RankableSingleImageView(data: data)
            } //: LOOP
        } //: HSTACK
    }
}

struct RankingImagesView_Previews: PreviewProvider {
    static let artists: [Rankable] = [Rankable(image: "drake", basicInfo: "Drake"), Rankable(image: "jcole", basicInfo: "J. Cole"), Rankable(image: "vince", basicInfo: "Vince Staples"), Rankable(image: "kanye", basicInfo: "Kanye West"), Rankable(image: "mac", basicInfo: "Mac Miller")]
    static let discover: Bool = false
    static var previews: some View {
        RankingImagesView(rankable: artists, discover: discover)
    }
}
