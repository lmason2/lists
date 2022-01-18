//
//  Constant.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

func getGradient(type: type) -> LinearGradient {
    switch type {
        case .music:
            return LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.red.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        case .movie:
            return LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.pink.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        case .food:
            return LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.5), Color.orange.opacity(1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        case .tv:
            return LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.5), Color.yellow.opacity(1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        case .sports:
            return LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.teal.opacity(1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        default:
            return LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.7), Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
    
