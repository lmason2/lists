//
//  ProfileRankingImageView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileRankingImageView: View {
    let image: String
    let tags: [String]
    var body: some View {
        HStack {
            Spacer()
            Image(image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
            
            VStack(alignment: .leading) {
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
            }
            Spacer()
        }
    }
}

struct ProfileRankingImageView_Previews: PreviewProvider {
    static let image: String = "alla"
    static let tags: [String] = ["Favorite", "Album", "All Time"]
    
    static var previews: some View {
        ProfileRankingImageView(image: image, tags: tags)
    }
}
