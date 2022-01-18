//
//  Post.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import Foundation

class Post: Codable, Identifiable, ObservableObject{
    let id = UUID()
    let typeString: String
    let tags: [String]
    let ranking: [Rankable]
    let comments: [Comment]
    let associations: [String]
    let pinned: Bool
    var type: type {
        if typeString == "music" {
            return .music
        }
        else if typeString == "movie" {
            return .movie
        }
        else if typeString == "food" {
            return .food
        }
        else if typeString == "television" {
            return .tv
        }
        else if typeString == "sports" {
            return .sports
        }
        else {
            return .error
        }
    }
}

enum type: String {
    case music = "music"
    case food = "food"
    case movie = "movie"
    case tv = "television"
    case sports = "sports"
    case error = ""
}
