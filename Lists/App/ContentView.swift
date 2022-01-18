//
//  ContentView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let profiles: [Profile] = Bundle.main.decode("profiles.json")
    let discoverUsers: [Profile] = Bundle.main.decode("discover.json")
    @State var displayHeader: Bool = true
    @State var feedExpanded: Bool = true
    
    // MARK: - BODY
    var body: some View {
        TabView {
            VStack {
                if displayHeader {
                    HeaderView(title: "Settings", image: "gearshape", feed: false, feedExpanded: $feedExpanded)
                }
                CreatePostView()
                Spacer()
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(
                        LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                    )
            } //: VSTACK
            .tabItem {
                Image(systemName: "gearshape")
            } //: TAB
            
            VStack {
                ProfileView(profile: profiles[0], displayHeader: $displayHeader, myProfile: true)
                Spacer()
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(
                        LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                    )
            } //: VSTACK
            .tabItem {
                Image(systemName: "person.circle")
            } //: TAB
            
            NavigationView {
                VStack {
                    if displayHeader {
                        HeaderView(title: "Feed", image: "bolt", feed: true, feedExpanded: $feedExpanded)
                    } //: CONDITIONAL
                    
                    FeedView(displayHeader: $displayHeader, feedExpanded: $feedExpanded)
                        .onAppear(perform: {
                            displayHeader = true
                        })
                    
                    // BOTTOM GRADIENT
                    Spacer()
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(
                            LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                        )
                } //: VSTACK
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            } //: NAVIGATIONVIEW
            .tabItem {
                Image(systemName: "bolt")
            } //: TAB
            
            VStack {
                if displayHeader {
                    HeaderView(title: "Discover", image: "globe", feed: false, feedExpanded: $feedExpanded)
                } //: CONDITIONAL
                
                DiscoverView(discoverProfiles: discoverUsers, displayHeader: $displayHeader, feedExpanded: $feedExpanded)
                    .onAppear(perform: {
                        displayHeader = true
                    })
                
                // BOTTOM GRADIENT
                Spacer()
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(
                        LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                    )
            } //: VSTACK
            .tabItem {
                Image(systemName: "globe")
            } //: TAB
        } //: TABVIEW
        .accentColor(.white)
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
