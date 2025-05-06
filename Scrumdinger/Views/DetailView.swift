//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 24/04/2025.
//
//TODO: By https://developer.apple.com/tutorials/app-dev-training/updating-app-data end of section 1. Need to refactor


import Foundation
import SwiftUI
import SwiftData

struct DetailView: View {
    let scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    @State private var errorWrapper: ErrorWrapper?
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: scrum, errorWrapper: $errorWrapper)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                if(scrum.attendees.isEmpty){
                    Text("No attendees yet")
                } else {
                    ForEach(scrum.attendees) { attendee in
                        Label(attendee.name, systemImage: "person")
                    }
                }
            }
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { meeting in
                    HStack {
                        Image(systemName: "calendar")
                        Text(meeting.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: scrum)
                    .navigationTitle(scrum.title)
                
            }
        }
        .sheet(item: $errorWrapper, onDismiss: nil){ errorWrapper in
            ErrorView(errorWrapper: errorWrapper)
        }
    }
}


#Preview(traits: .dailyScrumsSampleData) {
    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]

    NavigationStack{
        DetailView(scrum: scrums[0])
    }
}
