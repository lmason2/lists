//
//  HeaderView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    let title: String
    let image: String
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                Image(systemName: image)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                Spacer()
            } //: HSTACK
            .frame(height: 50)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .topTrailing)
            )
            
            HStack {
                Spacer()
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.white)
                    .padding()
            } //: HSTACK
        } //: ZSTACK
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Feed", image: "bolt")
    }
}
