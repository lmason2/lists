//
//  LikeCounter.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct VerticalLikeCounter: View {
    // MARK: - PROPERTIES
    @State var likeCount: Int
    @State var increment: Bool = false
    @State var noVote: Bool = true
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Button(action: {
                if noVote {
                    likeCount += 1
                    noVote = false
                }
                else {
                    if increment {
                        noVote = true
                        likeCount -= 1
                    }
                    else {
                        likeCount += 2
                    }
                }
                increment = true
            }, label: {
                Image(systemName: noVote ? "arrowtriangle.up" : (increment ? "arrowtriangle.up.fill" : "arrowtriangle.up"))
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
            })
            
            Text("\(likeCount)")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .padding(.horizontal, 3)
                .frame(height: 50)
            
            Button(action: {
                if noVote {
                    likeCount -= 1
                    noVote = false
                }
                else {
                    if !increment {
                        noVote = true
                        likeCount += 1
                    }
                    else {
                        likeCount -= 2
                    }
                }
                increment = false
            }, label: {
                Image(systemName: noVote ? "arrowtriangle.down" : (increment ? "arrowtriangle.down" : "arrowtriangle.down.fill"))
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.top, 2)
            })
        } //: VSTACK
        .frame(width: 60)
    }
}

struct LikeCounter_Previews: PreviewProvider {
    static let likeCount: Int = 50
    static let increment: Bool = true
    static var previews: some View {
        VerticalLikeCounter(likeCount: likeCount, increment: increment)
    }
}
