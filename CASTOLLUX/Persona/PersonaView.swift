//
//  View.swift
//  CASTOLLUX
//
//  Created by Nathanael DJ on 18/09/26.
//

import SwiftUI

struct PersonaView: View {
    
    //Variables
    @State private var name = ""
    
    @State private var personality = ""
    @State private var moralAlignment = ""
    @State private var purpose = ""
    @State private var speechStyle = ""
    
    //Arrays
    //move to database later
    let personalityOptions  = ["pessimistic", "friendly", "pragmatic", "numb"]
    let moralOptions        = ["neutral-evil", "chaotic-good", "neutral-neutral", "lawful-neutral"]
    let purposeOptions      = ["personal-gain", "peace-and-love", "wisdom", "clarity"]
    let speechOptions       = ["narcissist", "hopeful", "gentle", "direct"]
    
    let onSave: (Persona) -> Void
    
    var body: some View {
        NavigationStack {
                Form {
                    Section("Identity") {
                        TextField("This is...", text: $name)
                    } //name section
                    
                    Section("Personality") {
                        Picker("What would his energy type be?", selection: $personality) {
                            ForEach(personalityOptions, id: \.self) { o in Text(o)} //o is a standalone variable for  one option
                        }
                    } //personality section
                    
                    Section("Moral Alignment") {
                        Picker("What would his moral compass be?", selection: $moralAlignment) {
                            ForEach(moralOptions, id: \.self) {o in Text (o)}
                        }
                    } //moral section
                    
                    Section("Purpose") {
                        Picker("What would his purpose or dream?", selection: $purpose) {
                            ForEach(purposeOptions, id: \.self) {o in Text (o)}
                        }
                    } //purpose section
                    
                    Section("Speech Style") {
                        Picker("What would his speech style be?", selection: $speechStyle) {
                            ForEach(speechOptions, id: \.self) {o in Text (o)}
                        }
                    } //speech section
                    
                    Button("Save") {
                        savePersona()
                        //savePersonaStat()
                    }
                    
                } //form
                .navigationTitle("Persona")
        } //navigationstack
    } //body

    
    
    private func savePersona() {
        let newPersona = Persona(
            name: name,
            personality: personality,
            moralAlignment: moralAlignment,
            purpose: purpose,
            speechStyle: speechStyle
        )
        
        onSave(newPersona)
    }
    
    private func savePersonaStat() {
        print("Personality: ", personality)
        print("Moral Alignment:", moralAlignment)
        print("Purpose:", purpose)
        print("Speech Style:", speechStyle)
        
    }

}

