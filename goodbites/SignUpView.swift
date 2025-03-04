//
//  SignUpView.swift
//  goodbites
//
//  Created by Shweta Mate on 1/30/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var isTermsAccepted: Bool = false
    @State private var showTermsAndConditions: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // Back Button
            HStack {
                Button(action: {
                    // Handle back action
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.title)
                }
                Spacer()
            }
            .padding(.top, 10)
            
            // Centered Logo and Title
            HStack {
                Image(systemName: "leaf")
                    .foregroundColor(.white)
                    .font(.title)
                Text("FoodRescu")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
            }
            .padding(.bottom, 20)

            Text("Create an Account")
                .foregroundColor(.white)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            // Input Fields
            Group {
                CustomTextField(placeholder: "Username", text: $username)
                CustomSecureField(placeholder: "Password", text: $password)
                CustomTextField(placeholder: "Full Name", text: $fullName)
                CustomTextField(placeholder: "Email Address", text: $email)
                CustomTextField(placeholder: "Phone Number", text: $phoneNumber)
            }

            // Terms and Conditions Text
            Button(action: {
                showTermsAndConditions.toggle()
            }) {
                Text("I agree to the terms and conditions")
                    .foregroundColor(.white)
                    .font(.footnote)
            }
            .padding(.top, 5)

            // Sign Up Button
            Button(action: {
                // Handle sign-up action
            }) {
                Text("Sign up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isTermsAccepted ? Color.blue : Color.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!isTermsAccepted)

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .sheet(isPresented: $showTermsAndConditions) {
            TermsAndConditionsView(isAccepted: $isTermsAccepted)
        }
    }
}

// Custom TextField with Styling
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField("", text: $text, prompt: Text(placeholder).foregroundColor(.white.opacity(0.6)))
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
            .foregroundColor(.white)
            .textFieldStyle(PlainTextFieldStyle()) // Removes default styling
    }
}

// Custom SecureField with Styling
struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(.white.opacity(0.6)))
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
            .foregroundColor(.white)
            .textFieldStyle(PlainTextFieldStyle())
    }
}

// Terms and Conditions Pop-Up View
struct TermsAndConditionsView: View {
    @Binding var isAccepted: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Terms and Conditions")
                .font(.title)
                .bold()
                .padding(.top)

            ScrollView {
                Text("Here will be the terms and conditions text... (you can add a long description here)")
                    .padding()
            }

            Button(action: {
                isAccepted.toggle()
                dismiss() // Dismiss the pop-up when terms are accepted
            }) {
                Text("I Accept")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isAccepted ? Color.blue : Color.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!isAccepted)

            Button(action: {
                // Close the pop-up without accepting
                dismiss()
            }) {
                Text("Close")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
