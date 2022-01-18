//
//  ContentView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    let profiles: [Profile] = Bundle.main.decode("profiles.json")
    let discoverUsers: [Profile] = Bundle.main.decode("discover.json")

    var body: some View {
            TabView {
                VStack {
                    HeaderView(title: "Settings", image: "gearshape")
                    SettingsView()
                    Spacer()
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(
                            LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                        )
                }
                .tabItem {
                    Image(systemName: "gearshape")
                }
                
                VStack {
                    ProfileView(profile: profiles[0])
                    Spacer()
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(
                            LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                        )
                }
                .tabItem {
                    Image(systemName: "person.circle")
                }
                
                VStack {
                    HeaderView(title: "Feed", image: "bolt")
                    FeedView()
                    Spacer()
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(
                            LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                        )
                }
                .tabItem {
                    Image(systemName: "bolt")
                }
                
                VStack {
                    HeaderView(title: "Discover", image: "globe")
                    DiscoverView(discoverProfiles: discoverUsers)
                    Spacer()
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(
                            LinearGradient(colors: [.blue.opacity(0.3), .pink.opacity(0.3)], startPoint: .leading, endPoint: .trailing)
                        )
                }
                .tabItem {
                    Image(systemName: "globe")
                }
            }
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
