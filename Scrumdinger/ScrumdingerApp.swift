//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 20/04/2025.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {

    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}
