//
//  MeetingHeader.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 01/05/2025.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingHeaderView: View {
    var secondsElapsed: Int
    var secondsRemaining: Int
    var theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    var body: some View {
        
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)

                    
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100, theme: .bubblegum)
}
