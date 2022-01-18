//
//  LikeCounter.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct LikeCounter: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Image(systemName: "arrowtriangle.up")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding(.bottom, 2)
            
            Text("1000")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .padding(.horizontal, 3)
            
            Image(systemName: "arrowtriangle.down")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding(.top, 2)
        } //: VSTACK
    }
}

struct LikeCounter_Previews: PreviewProvider {
    static var previews: some View {
        LikeCounter()
    }
}
