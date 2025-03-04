//
//  ContentView.swift
//  goodbites
//
//  Created by Shweta Mate on 1/29/25.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Illustration
                Image("Start") // Replace with your asset name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                // Title
                Text("GoodBites")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                // Subtitle
                Text("Explore food donations & make a difference today!")
                    .font(.system(size: 18))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                
                Spacer()
                
                // Get Started Button
                NavigationLink(destination: LoginView()) {
                    Text("Get started")
                        .font(.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
            .background(Color.black.ignoresSafeArea()) // Background color
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
