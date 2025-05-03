//
//  History.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 03/05/2025.
//

import Foundation

struct History: Identifiable{
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }}
