//
//  PersonaDetailView.swift
//  CASTOLLUX
//
//  Created by Nathanael DJ on 26/09/26.
//

import SwiftUI

struct PersonaDetailView: View {
    let persona: Persona //regulates specific persona in order to call a persona. thus a 'null' persona is not callable
    
    var body: some View {
        Form {
            Section("Personality") {
                LabeledContent(
                    "Personality",
                    value: persona.personality
                )
                
                LabeledContent(
                    "Morality",
                    value: persona.moralAlignment
                )
                
                LabeledContent(
                    "Purpose",
                    value: persona.purpose
                )
                
                LabeledContent(
                    "Speech Style",
                    value: persona.speechStyle
                )
            }
        } //form
        .navigationTitle(persona.name)
    } //body
}
