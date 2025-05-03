//
//  NewScrumMeetView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 03/05/2025.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum, savedEdits: {dailyScrum in scrums.append(newScrum)})
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData))
}
