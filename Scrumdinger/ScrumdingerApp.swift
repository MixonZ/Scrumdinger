//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 20/04/2025.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
