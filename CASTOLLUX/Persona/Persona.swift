//
//  Persona.swift
//  CASTOLLUX
//
//  Created by Nathanael DJ on 26/09/26.
//

import Foundation

// this will let a persona has all four characteristics
struct Persona: Identifiable, Codable {
    var id: UUID = UUID()
    
    var name: String
    var personality: String
    var moralAlignment: String
    var purpose: String
    var speechStyle: String
}
