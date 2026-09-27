//
//  PersonaSummaryView.swift
//  CASTOLLUX
//
//  Created by Nathanael DJ on 26/09/26.
//

import SwiftUI
import SwiftData

struct PersonaSummaryView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Persona.createdAt) private var personas: [Persona]
    
    @State private var showingCreaetePersona = false
    
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
                    modelContext.insert(newPersona) //add new persona to array
                    showingCreaetePersona = false
                }
            }
        }
        
    } //body
}
