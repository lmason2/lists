//
//  CommentLikeCounter.swift
//  Lists
//
//  Created by Luke Mason on 1/22/22.
//

import SwiftUI

struct HorizontalLikeCounter: View {
    // MARK: - PROPERTIES
    @State var likeCount: Int
    @State var increment: Bool = false
    @State var noVote: Bool = true
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                if noVote {
                    increment = false
                    noVote = false
                    likeCount -= 1
                }
                else {
                    if increment {
                        increment = false
                        likeCount -= 2
                    }
                    else {
                        increment = true
                        noVote = true
                        likeCount += 1
                    }
                }
            }, label: {
                Image(systemName: noVote ? "arrowtriangle.down" : (increment ? "arrowtriangle.down" : "arrowtriangle.down.fill"))
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            })
            
            Text("\(likeCount)")
                .foregroundColor(.white)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
                .padding(.horizontal, 3)
                .frame(width: 20)
            
            Button(action: {
                if noVote {
                    increment = true
                    noVote = false
                    likeCount += 1
                }
                else {
                    if !increment {
                        increment = true
                        likeCount += 2
                    }
                    else {
                        increment = false
                        noVote = true
                        likeCount -= 1
                    }
                }
            }, label: {
                Image(systemName: noVote ? "arrowtriangle.up" : (increment ? "arrowtriangle.up.fill" : "arrowtriangle.up"))
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            })
            
        } //: HSTACK
        .frame(width: 60)
        .padding(.trailing, 5)
    }
}

struct CommentLikeCounter_Previews: PreviewProvider {
    static let likeCount: Int = 50
    static var previews: some View {
        HorizontalLikeCounter(likeCount: likeCount)
    }
}
