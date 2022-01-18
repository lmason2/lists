//
//  ProfileHeadingView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ProfileHeadingView: View {
    // MARK: - PROPERTIES
    let profile: Profile
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Spacer()
            
            Image(profile.image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 2))
                .frame(width: 100, height: 100)
                .padding(.trailing, 15)
            
            VStack {
                Text(profile.name)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text("@\(profile.id)")
                    .font(.system(size: 15, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Button(action: {
                    
                }, label: {
                    Text("Edit Profile")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }) //: BUTTON
                .padding(.horizontal, 20)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(.white, lineWidth: 3))
            } //: VSTACK
            
            Spacer()
        } //: HSTACK
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.8), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}

struct ProfileHeadingView_Previews: PreviewProvider {
    static let profiles: [Profile] = Bundle.main.decode("profiles.json")
    static var previews: some View {
        ProfileHeadingView(profile: profiles[0])
    }
}
