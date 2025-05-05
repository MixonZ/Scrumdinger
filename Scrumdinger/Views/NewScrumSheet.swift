//
//  NewScrumMeetView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 03/05/2025.
//

import SwiftUI

struct NewScrumSheet: View {

    var body: some View {
        NavigationStack {
            DetailEditView(scrum: nil)
        }
    }
}

#Preview {
    NewScrumSheet()
}
