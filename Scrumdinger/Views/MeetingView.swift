//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 20/04/2025.
//

import SwiftUI
import TimerKit
import AVFoundation

struct MeetingView: View {
    @Environment(\.modelContext) private var context
    let scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    @Binding var errorWrapper: ErrorWrapper?
    
    private let player = AVPlayer.dingPlayer()
    
    fileprivate func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map{ $0.name })
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
            
        }
        scrumTimer.startScrum()
    }
    
    fileprivate func endScrum() throws {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
        try context.save()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .onAppear{
            startScrum()
        }
        .onDisappear{
            do {
                try endScrum()
            } catch{
                errorWrapper = ErrorWrapper(error: error, guidence: "Meeting time was not recorded. Try again later.")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: scrum, errorWrapper: .constant(nil))
}
