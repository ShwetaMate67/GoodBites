//
//  ContentView.swift
//  goodbites
//
//  Created by Shweta Mate on 1/29/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var navigateToDashboard = false
    @State private var navigateToSignUp = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    // Illustration
                    Image("Login") // Replace with your asset name
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)

                    // Title
                    Text("Connect with Local Food")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    // Subtitle
                    Text("Supporting community events, reduce food waste")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, -5)

                    Spacer()

                    // Username Field
                    TextField("", text: $username, prompt: Text("Username").foregroundColor(.white.opacity(0.6)))
                        .padding()
                        .frame(height: 45.0)
                        .background(Color.gray.opacity(0.20)) // Gray background
                        .foregroundColor(.white) // White text when user types
                        .cornerRadius(24)
                        .padding(.top, 20)

                    // Password Field
                    SecureField("", text: $password, prompt: Text("Password").foregroundColor(.white.opacity(0.6)))
                        .padding()
                        .frame(height: 45.0)
                        .background(Color.gray.opacity(0.20)) // Gray background
                        .foregroundColor(.white) // White text when user types
                        .cornerRadius(24)
                        .padding(.top, 10)

                    // Checkbox for Remember Me
                    Button(action: {
                        rememberMe.toggle()
                    }) {
                        HStack {
                            Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                .foregroundColor(.white)
                                .font(.system(size: 22))

                            Text("Remember me")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                        }
                    }
                    .padding(.top, 5)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Log In Button
                    Button(action: {
                        navigateToDashboard = true
                    }) {
                        Text("Log in")
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 15.0)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(24)
                    }
                    .padding(.horizontal, 2)
                    .padding(.top, 20)
                    .navigationDestination(isPresented: $navigateToDashboard) {
                        DashboardView()
                    }

                    // Divider
                    HStack {
                        Divider()
                            .frame(width: 100, height: 1)
                            .background(Color.white)

                        Text("New User")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))

                        Divider()
                            .frame(width: 100, height: 1)
                            .background(Color.white)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                    // Navigation to Sign Up
                    Button(action: {
                        navigateToSignUp = true
                    }) {
                        Text("Sign up")
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 15.0)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(24)
                            .padding(.top, 10)
                    }
                    .navigationDestination(isPresented: $navigateToSignUp) {
                        SignUpView()
                    }

                    // Text
                    Text("Create an account to get started")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 28.0)
                        .padding(.top, 10)

                    Spacer()
                        .padding()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
