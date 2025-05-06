//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 06/05/2025.
//

import Foundation


struct ErrorWrapper: Identifiable{
    let id: UUID
    let error: Error
    let guidence: String
    
    init(id: UUID = UUID(), error: Error, guidence: String) {
        self.id = id
        self.error = error
        self.guidence = guidence
    }
}
