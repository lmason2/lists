//
//  RankableSingleImageView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankableSingleImageView: View {
    let data: Rankable
    var body: some View {
        VStack(spacing: 3) {
            Image(data.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
                .clipped()
                .overlay(Rectangle().stroke(.white, lineWidth: 1))
            
            Text(data.basicInfo)
                .foregroundColor(.white)
                .font(.system(size: 8, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.17)
            
            if let secondary = data.secondary {
                Text(secondary)
                    .foregroundColor(.white)
                    .font(.system(size: 6, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.17)
            }
            if let tertiary = data.tertiary {
                Text(tertiary)
                    .foregroundColor(.white)
                    .font(.system(size: 6, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.17)
            }
        }
    }
}

struct RankableSingleImageView_Previews: PreviewProvider {
    static let data: Rankable = Rankable(image: "drake", basicInfo: "Drake")
    static var previews: some View {
        RankableSingleImageView(data: data)
    }
}
