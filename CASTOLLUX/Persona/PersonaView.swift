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
                            //regulates no auto correction, and no auto capitalization
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    } //name section
                    
                    Section("Personality") {
                        Menu {
                            ForEach(personalityOptions, id: \.self) { option in
                                Button(option) {
                                    personality = option
                                }
                            }
                        } label: {
                            HStack {
                                Text(
                                    personality.isEmpty
                                        ? "What would his energy type be?"
                                        : personality
                                )
                                .foregroundStyle(.primary)

                                Spacer()

                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    } //personality section
                    
                    Section("Moral Alignment") {
                        Menu {
                            ForEach(moralOptions, id: \.self) { option in
                                Button(option) {
                                    moralAlignment = option
                                }
                            }
                        } label: {
                            HStack {
                                Text(
                                    moralAlignment.isEmpty
                                        ? "What would his moral compass be?"
                                        : moralAlignment
                                )
                                .foregroundStyle(.primary)

                                Spacer()

                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    } //moral section
                    
                    Section("Purpose") {
                        Menu {
                            ForEach(purposeOptions, id: \.self) { option in
                                Button(option) {
                                    purpose = option
                                }
                            }
                        } label: {
                            HStack {
                                Text(
                                    purpose.isEmpty
                                        ? "What would his purpose or dream be?"
                                        : purpose
                                )
                                .foregroundStyle(.primary)

                                Spacer()

                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    } //purpose section
                    
                    Section("Speech Style") {
                        Menu {
                            ForEach(speechOptions, id: \.self) { option in
                                Button(option) {
                                    speechStyle = option
                                }
                            }
                        } label: {
                            HStack {
                                Text(
                                    speechStyle.isEmpty
                                        ? "What would his speech style be?"
                                        : speechStyle
                                )
                                .foregroundStyle(.primary)

                                Spacer()

                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundStyle(.secondary)
                            }
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

