//
//  FullPostImagesView.swift
//  Lists
//
//  Created by Luke Mason on 1/22/22.
//

import SwiftUI

struct FullPostImagesView: View {
    let rankable: [Rankable]
    var body: some View {
        VStack {
            ForEach(0..<((rankable.count - 1) / 3) + 1) { i in
                HStack(alignment: .top, spacing: 5) {
                    ForEach(0..<3) {j in
                        if (((i * 3) + j) < (rankable.count)) {
                            RankableSingleImageView(data: rankable[(i * 3) + j], fullPost: true)
                        }
                    }
                }
            }
        }
    }
}

struct FullPostImagesView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    static var previews: some View {
        FullPostImagesView(rankable: profiles[0].posts[0].ranking)
    }
}
