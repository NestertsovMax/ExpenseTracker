//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by M1 on 17.06.2024.
//

import SwiftUI
import CoreData

@main
struct ExpenseTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
