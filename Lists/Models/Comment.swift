//
//  Comment.swift
//  Lists
//
//  Created by Luke Mason on 1/18/22.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id = UUID()
    let username: String
    let content: String
}
