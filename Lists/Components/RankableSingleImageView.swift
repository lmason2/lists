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
    @State var fullPost: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            Image(data.image)
                .resizable()
                .scaledToFill()
                .frame(width: fullPost ? UIScreen.main.bounds.width * 0.30 : UIScreen.main.bounds.width * 0.25, height: fullPost ? UIScreen.main.bounds.width * 0.30 : UIScreen.main.bounds.width * 0.25)
                .clipped()
                .overlay(Rectangle().stroke(.white, lineWidth: 1))
            
            Text(data.basicInfo)
                .foregroundColor(.white)
                .font(.system(size: 8, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .frame(maxWidth: fullPost ? UIScreen.main.bounds.width * 0.30 : UIScreen.main.bounds.width * 0.25)
            
            if let secondary = data.secondary {
                Text(secondary)
                    .foregroundColor(.white)
                    .font(.system(size: 8, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: fullPost ? UIScreen.main.bounds.width * 0.30 : UIScreen.main.bounds.width * 0.25)
            } //: CONDITIONAL
            
            if let tertiary = data.tertiary {
                Text(tertiary)
                    .foregroundColor(.white)
                    .font(.system(size: 8, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: fullPost ? UIScreen.main.bounds.width * 0.30 : UIScreen.main.bounds.width * 0.25)
            } //: CONDITIONAL
        } //: VSTACK
    }
}

struct RankableSingleImageView_Previews: PreviewProvider {
    static let data: Rankable = Rankable(image: "drake", basicInfo: "Drake")
    static var previews: some View {
        RankableSingleImageView(data: data, fullPost: false)
    }
}
