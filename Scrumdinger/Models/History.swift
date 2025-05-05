//
//  History.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 03/05/2025.
//

import Foundation
import SwiftData

@Model
class History: Identifiable{
    let id: UUID
    let date: Date
    var attendees: [Attendee]
    var dailyScrum: DailyScrum?
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }}
