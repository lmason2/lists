//
//  SignInWIthEmail.swift
//  Lists
//
//  Created by Luke Mason on 1/22/22.
//

import SwiftUI

struct SignInWIthEmail: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State var newUser: Bool = false
    @Binding var isSigningInWithEmail: Bool
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @FocusState var initialFocus: FocusField?
    enum FocusField: Hashable {
        case field
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        isSigningInWithEmail = false
                    }
                }, label: {
                        ZStack {
                            Image(systemName: "chevron.down.square")
                                .foregroundColor(.white)
                            
                            Image(systemName: "chevron.down.square.fill")
                                .foregroundColor(Color.black)
                        }
               })
            }

            if newUser {
                TextField("Full Name", text: $fullName)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
                TextField("Email", text: $email)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
            }
            TextField("Username", text: $username)
                .focused($initialFocus, equals: .field)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
                .task {
                    self.initialFocus = .field
                }
                
                
            TextField("Password", text: $password)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
            if newUser {
                TextField("Confirm Password", text: $confirmPassword)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
            }

            HStack {
                Button(action: {
                    withAnimation {
                        isLoggedIn = true
                    }
                }, label: {
                    HStack {
                        Spacer()
                        Text(newUser ? "Sign Up" : "Sign In")
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Spacer()
                    }
                })
            }
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 5))
            .cornerRadius(5)
            
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        newUser.toggle()
                    }
                }, label: {
                    Text(newUser ? "Already Have An Account? Sign In" : "New Here? Create Account")
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                })
                Spacer()
            }
        }
    }
}

struct SignInWIthEmail_Previews: PreviewProvider {
    @State static var isSigningInWithEmail: Bool = true
    static var previews: some View {
        SignInWIthEmail(isSigningInWithEmail: $isSigningInWithEmail)
    }
}
