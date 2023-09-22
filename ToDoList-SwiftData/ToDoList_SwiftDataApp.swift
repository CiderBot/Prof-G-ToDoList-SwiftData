//
//  ToDoList_SwiftDataApp.swift
//  ToDoList-SwiftData
//
//  Created by Steven Yung on 9/21/23.
//

import SwiftUI
import SwiftData

@main
struct ToDoList_SwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDo.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ToDoListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
