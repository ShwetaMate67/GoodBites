//
//  CommunityStoriesView.swift
//  goodbites
//
//  Created by Shweta Mate on 2/2/25.
//

import SwiftUI

struct CommunityStoriesView: View {
    @State private var showCreateEvent = false
    @State private var events: [Event] = []

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Image("Sto") // Replace with your asset name
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .frame(height: 250)
                Text("Community Gathering")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(events) { event in
                            EventCard(event: event)
                        }
                    }
                    .padding()
                }

                Text("Events")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading)

                HStack(spacing: 20) {
                    EventIcon(name: "Food Drive", systemImage: "fork.knife")
                    EventIcon(name: "Fundraiser", systemImage: "hand.raised")
                    EventIcon(name: "Donation", systemImage: "gift")
                    EventIcon(name: "Workshop", systemImage: "book")
                }
                .padding()

                Spacer()

                Button(action: {
                    showCreateEvent.toggle()
                }) {
                    Text("Create An Event")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(20)
                }
                .padding()
                .sheet(isPresented: $showCreateEvent) {
                    CreateEventView(events: $events)
                }
            }
            .background(Color.black.ignoresSafeArea())
            .foregroundColor(.white)
            .navigationBarHidden(true)
        }
    }
}

struct EventCard: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading) {
            Image(event.imageName)
                .resizable()
                .frame(width: 150, height: 100)
                .cornerRadius(10)
            Text(event.title)
                .font(.headline)
            Text("\(event.location) \(event.distance) meters away")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 160)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}

struct EventIcon: View {
    var name: String
    var systemImage: String

    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            Text(name)
                .font(.footnote)
        }
    }
}

struct CreateEventView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var events: [Event]

    @State private var title = ""
    @State private var location = ""
    @State private var distance = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Event Details")) {
                    TextField("Title", text: $title)
                    TextField("Location", text: $location)
                    TextField("Distance (in meters)", text: $distance)
                        .keyboardType(.numberPad)
                }

                Button(action: {
                    let newEvent = Event(title: title, location: location, distance: distance, imageName: "placeholder")
                    events.append(newEvent)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Post Event")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Create Event")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct Event: Identifiable {
    let id = UUID()
    var title: String
    var location: String
    var distance: String
    var imageName: String
}

struct CommunityStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityStoriesView()
    }
}
