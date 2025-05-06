//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 06/05/2025.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidence)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .backgroundStyle(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Dismiss"){
                        dismiss()
                    }
                }
            }
        }
    }
}

private enum SampleError: Error {
    case errorRequired
}

#Preview {
    ErrorView(errorWrapper: ErrorWrapper(error: SampleError.errorRequired, guidence: "You can safely ignore this error."))
}
