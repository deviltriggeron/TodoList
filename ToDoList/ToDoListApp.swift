//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/17/25.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    let persistenceController = PersistenceController.shared
    var assemblies = ListAssemblies()
    
    var body: some Scene {
        WindowGroup {
            ListView(viewState: assemblies.build())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    if isFirstLaunch() {
                        assemblies.services.fetchData {
                            print("Data loaded")
                        }
                    }
                }
        }
    }
    
    private func resetAndFetchData() {
        UserDefaults.standard.set(false, forKey: "HasLaunchedBefore")
        assemblies.services.fetchData {
            print("Data refresh")
        }
    }
    
    private func isFirstLaunch() -> Bool {
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: "HasLaunchedBefore")
        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: "HasLaunchedBefore")
        }
        return isFirstLaunch
    }
}


