//
//  DashboardView.swift
//  goodbites
//
//  Created by Shweta Mate on 1/30/25.
//
//  DashboardView.swift
//  goodbites

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = "Available donations"

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Text("Food")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "pineapple") // Placeholder image
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()

                // Tab Selection
                HStack {
                    Button(action: { selectedTab = "Available donations" }) {
                        Text("Available donations")
                            .fontWeight(selectedTab == "Available donations" ? .bold : .regular)
                            .underline(selectedTab == "Available donations")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: { selectedTab = "Community stories" }) {
                        Text("Community stories")
                            .fontWeight(selectedTab == "Community stories" ? .bold : .regular)
                            .underline(selectedTab == "Community stories")
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)

                // Content
                if selectedTab == "Available donations" {
                    ScrollView {
                        Button(action: {
                            // Action for creating a new post
                        }) {
                            Text("Donate now")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .padding()

                        DonationCard(imageName: "fresh_produce", title: "Fresh Produce", location: "Green Valley Community Center", availableUntil: "5 PM today")

                        DonationCard(imageName: "bakery_delight", title: "Bakery Delight", location: "Baker's Corner", availableUntil: "6 PM today")

                        DonationCard(imageName: "rice_grains", title: "Rice & Grains", location: "Community Aid Center", availableUntil: "7 PM today")
                    }
                } else {
                    CommunityStoriesView()
                }

                Spacer()
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}

struct DonationCard: View {
    var imageName: String
    var title: String
    var location: String
    var availableUntil: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)

            Text(title)
                .font(.headline)
                .padding(.top, 5)
                .foregroundColor(.white)
            Text("Location: \(location)")
                .font(.subheadline)
                .foregroundColor(.white)
            Text("Available until: \(availableUntil)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Button(action: {
                // Claim donation action
            }) {
                Text("Claim Donation")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding(.vertical, 5)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
