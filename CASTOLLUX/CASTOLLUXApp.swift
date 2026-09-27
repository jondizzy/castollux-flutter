//
//  CASTOLLUXApp.swift
//  CASTOLLUX
//
//  Created by Nathanael DJ on 18/09/26.
//

import SwiftUI
import SwiftData

@main
struct CASTOLLUXApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Persona.self,
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false) //let the data is really stored not just in RAM

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            PersonaSummaryView()
        }
        .modelContainer(sharedModelContainer)
    }
}
