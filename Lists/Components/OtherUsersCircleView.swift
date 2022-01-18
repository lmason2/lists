//
//  OtherUsersCircleView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct OtherUsersCircleView: View {
    let associations: [String]
    @State private var offset: CGFloat = -20
    
    func changeOffset(index: Int) -> CGFloat {
        return CGFloat((index + 1)) * offset
    }
    var body: some View {
        HStack (spacing: 0){
            ZStack {
                Image(systemName: "ellipsis.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                ForEach(0..<associations.count) {index in
                    Image(self.associations[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 1))
                        .offset(x: changeOffset(index: index))
                }
            }
            
            Text("+ 18 more")
                .foregroundColor(.white)
                .font(.system(size: 8, weight: .light, design: .rounded))
        }
    }
}

struct OtherUsersCircleView_Previews: PreviewProvider {
    static let associations: [String] = ["Luke-main", "Ben-main", "Yacine-main"]
    static var previews: some View {
        OtherUsersCircleView(associations: associations)
    }
}
