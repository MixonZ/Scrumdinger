//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 24/04/2025.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var attendeeName = ""
    var body: some View {
        Form {
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            attendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add atendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
        Text("Detail Edit View")
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    DetailEditView(scrum: $scrum)
}
