//
//  RankableSingleImageView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankableSingleImageView: View {
    // MARK: - PROPERTIES
    let data: Rankable
    let topThree: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            Image(data.image)
                .resizable()
                .scaledToFill()
                .frame(width: topThree ? UIScreen.main.bounds.width * 0.25 : UIScreen.main.bounds.width * 0.17, height: topThree ? UIScreen.main.bounds.width * 0.25 : UIScreen.main.bounds.width * 0.17)
                .clipped()
                .overlay(Rectangle().stroke(.white, lineWidth: 1))
            
            Text(data.basicInfo)
                .foregroundColor(.white)
                .font(.system(size: topThree ? 8 : 6, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .frame(maxWidth: topThree ? UIScreen.main.bounds.width * 0.25 : UIScreen.main.bounds.width * 0.17)
            
            if let secondary = data.secondary {
                Text(secondary)
                    .foregroundColor(.white)
                    .font(.system(size: topThree ? 8 : 6, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: topThree ? UIScreen.main.bounds.width * 0.25 : UIScreen.main.bounds.width * 0.17)
            } //: CONDITIONAL
            
            if let tertiary = data.tertiary {
                Text(tertiary)
                    .foregroundColor(.white)
                    .font(.system(size: topThree ? 8 : 6, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: topThree ? UIScreen.main.bounds.width * 0.25 : UIScreen.main.bounds.width * 0.17)
            } //: CONDITIONAL
        } //: VSTACK
    }
}

struct RankableSingleImageView_Previews: PreviewProvider {
    static let data: Rankable = Rankable(image: "drake", basicInfo: "Drake")
    static var previews: some View {
        RankableSingleImageView(data: data, topThree: false)
    }
}
