//
//  RankingHeaderView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingHeaderView: View {
    let image: String
    let username: String
    let tags: [String]
    let pinned: Bool
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 2))
                .frame(width: 30, height: 30)
            
            Text("\(username) ranked...")
                .font(.system(size: 12))
                .foregroundColor(.white)
            
            ForEach(tags, id: \.self) {tag in
                Text(tag)
                    .font(.system(size: 10))
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(.white, lineWidth: 2))
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
            }
            
            Spacer()
            
            if pinned {
                Image(systemName: "pin")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
    }
}

struct RankingHeaderView_Previews: PreviewProvider {
    static let image = "Ben-main"
    static let username = "bhogan9"
    static let tags = ["Favorite", "Albums", "All Time"]
    static var previews: some View {
        RankingHeaderView(image: image, username: username, tags: tags, pinned: true)
            .previewLayout(.sizeThatFits)
    }
}
