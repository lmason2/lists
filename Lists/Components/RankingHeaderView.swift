//
//  RankingHeaderView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct RankingHeaderView: View {
    // MARK: - PROPERTIES
    let profile: Profile
    let image: String
    let username: String
    let tags: [String]
    let pinned: Bool
    @Binding var displayHeader: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                displayHeader = false
            }, label: {
                NavigationLink(destination: ProfileView(profile: profile, displayHeader: $displayHeader, myProfile: false)) {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                        .frame(width: 30, height: 30)
                } //: NAVLINK
            }) //: BUTTON
            .disabled(pinned)
            
            
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
            } //: LOOP
            
            Spacer()
            
            if pinned {
                Image(systemName: "pin")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            } //: CONDITIONAL
        } //: HSTACK
    }
}

struct RankingHeaderView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    static let image = "Ben-main"
    static let username = "bhogan9"
    static let tags = ["Favorite", "Albums", "All Time"]
    @State static var displayHeader: Bool = true
    static var previews: some View {
        RankingHeaderView(profile: profiles[0], image: image, username: username, tags: tags, pinned: true, displayHeader: $displayHeader)
            .previewLayout(.sizeThatFits)
    }
}
