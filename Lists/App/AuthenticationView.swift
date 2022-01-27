//
//  AuthenticationView.swift
//  Lists
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var performScale = false
    @State private var isSigningInWithEmail = false
    
    var body: some View {
        ZStack {
            if !isSigningInWithEmail {
                VStack {
                    Spacer()
                    Image("rnkr_logo_cropped")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(performScale ? 1 : 0.5)
                    Spacer()
                }
            }
            
            VStack {
                Spacer()
                if isSigningInWithEmail {
                    SignInWIthEmail(isSigningInWithEmail: $isSigningInWithEmail)
                }
                else {
                    Button(action: {
                        withAnimation {
                            isSigningInWithEmail = true
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Sign in with Email")
                                .padding(.vertical, 5)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                    })
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(5)
                }
                Button(action: {
                    
                }, label: {
                    HStack {
                        Spacer()
                        Text("Sign in with Apple")
                            .padding(.vertical, 5)
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Spacer()
                    }
                })
                .background(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
            }
            .padding()
        } //: ZSTACK
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 5))
        .cornerRadius(10)
        .padding(5)
        .onAppear {
            withAnimation(.spring()) {
                performScale = true
            }
        }
        
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
