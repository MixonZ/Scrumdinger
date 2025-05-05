//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 21/04/2025.
//

import SwiftUI
import SwiftData

struct ScrumsView: View {
    @Query(sort: \DailyScrum.title) private  var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView: Bool = false
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                        
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily scrum")
            .toolbar{
                Button(action: { isPresentingNewScrumView = true}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView){
            NewScrumSheet()
        }
    }
}

#Preview {
    ScrumsView()
}
