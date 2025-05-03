//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 03/05/2025.
//

import SwiftUI
import TimerKit

struct MeetingFooterView: View {
    var speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    var speakerNumber: Int?{
        guard let index = speakers.firstIndex(where: {
            !$0.isCompleted
        }) else {
            return nil
        }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy(\.isCompleted)
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else {return "No more speakers"}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    var body: some View {
        VStack {
            HStack(spacing: 0.0) {
                if isLastSpeaker {
                        Text("Last speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable var speakers = DailyScrum.sampleData[0].attendees.map{
        $0.name
    }.map{
        ScrumTimer.Speaker(name: $0, isCompleted: false)
    }
    MeetingFooterView(speakers: speakers, skipAction: {})
}
