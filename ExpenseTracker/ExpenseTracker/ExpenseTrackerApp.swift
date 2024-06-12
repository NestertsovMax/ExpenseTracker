//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by M1 on 10.06.2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    let persistenceController = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}
