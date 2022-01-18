//
//  ProfileRankingHeaderView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileRankingHeaderView: View {
    // MARK: - PROPERTIES
    let image: String
    let username: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 2))
                .frame(width: 30, height: 30)
            
            Text("\(username) ranked...")
                .font(.system(size: 12))
                .foregroundColor(.white)
        } //: HSTACK
    }
}

struct ProfileRankingHeaderView_Previews: PreviewProvider {
    static let image = "Ben-main"
    static let username = "bhogan9"
    static var previews: some View {
        ProfileRankingHeaderView(image: image, username: username)
    }
}
