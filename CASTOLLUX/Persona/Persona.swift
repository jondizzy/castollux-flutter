//
//  Persona.swift
//  CASTOLLUX
//
//  Created by Nathanael DJ on 26/09/26.
//

import Foundation
import SwiftData

// this will let a persona has all four characteristics
@Model
final class Persona {
    var id: UUID
    var name: String
    var personality: String
    var moralAlignment: String
    var purpose: String
    var speechStyle: String
    var createdAt: Date
    
    init(
        id: UUID = UUID(),
        name: String,
        personality: String,
        moralAlignment: String,
        purpose: String,
        speechStyle: String,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.personality = personality
        self.moralAlignment = moralAlignment
        self.purpose = purpose
        self.speechStyle = speechStyle
        self.createdAt = createdAt
    }
}
