//
//  Profile.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import Foundation

class Profile: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let posts: [Post]
    let following: [String]
}
