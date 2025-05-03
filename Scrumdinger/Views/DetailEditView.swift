//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 24/04/2025.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    let savedEdits: (DailyScrum) -> Void
    
    @State private var attendeeName = ""
    @Environment(\.dismiss) private var dismiss
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
                            scrum.attendees.append(attendee)
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
        .toolbar{
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction){
                Button("Done"){
                    savedEdits(scrum)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    DetailEditView(scrum: $scrum, savedEdits: { _ in })
}
