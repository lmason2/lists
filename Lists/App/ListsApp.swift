//
//  ListsApp.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

@main
struct ListsApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
                    .preferredColorScheme(.light)
            }
            else {
                AuthenticationView()
            }
        }
    }
}
