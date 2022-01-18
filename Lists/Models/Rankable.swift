//
//  Rankable.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import Foundation

struct Rankable: Codable, Identifiable {
    let id = UUID()
    let image: String
    let basicInfo: String
    var secondary: String?
    var tertiary: String?
}
