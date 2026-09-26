//
//  PersonaSummaryView.swift
//  CASTOLLUX
//
//  Created by Nathanael DJ on 26/09/26.
//

import SwiftUI

struct PersonaSummaryView: View {
    @State private var showingCreaetePersona = false
    
    
    @State private var	 personas: [Persona] = [
        //sample personas are hardcoded here
        Persona(
            name: "Golliath",
            personality: "pessimistic",
            moralAlignment: "neutral-evil",
            purpose: "personal-gain",
            speechStyle: "narcissist"
        ),
        Persona(
            name: "Gaelid",
            personality: "friendly",
            moralAlignment: "chaotic-good",
            purpose: "peace-and-love",
            speechStyle: "hopeful"
        )
    ]
    
    var body: some View {
        NavigationStack {
            List(personas) { persona in
                NavigationLink {
                    PersonaDetailView(persona: persona)
                } label: {
                    Text(persona.name)
                }
            }
            .navigationTitle("Personas")
            .toolbar { //add + Button to create new persona
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingCreaetePersona = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCreaetePersona) {
                PersonaView { newPersona in //call newPersona
                    personas.append(newPersona) //add new persona to array
                    showingCreaetePersona = false
                }
            }
        }
        
    } //body
}
