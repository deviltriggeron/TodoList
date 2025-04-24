//
//  ListInteractor.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import SwiftUI
import CoreData

enum ListInteractorError: Error {
    case emptyDataStore
}

final class ListInteractor: ListInteractorProtocol {
    
    var presenter: (any ListPresenterProtocol)?
    
    @Environment(\.managedObjectContext)var viewContext: NSManagedObjectContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    var items: FetchedResults<TaskItem>
    
    func retrieveTasks() -> FetchedResults<TaskItem> {
        return items
    }
    
    func clearDataStore() {
        let context = self.viewContext
        let persistentStoreCoordinator = PersistenceController.shared.container.persistentStoreCoordinator

        for entityName in persistentStoreCoordinator.managedObjectModel.entities.map({ $0.name }).compactMap({ $0 }) {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try context.execute(batchDeleteRequest)
                print("\(entityName) cleared successfully.")
            } catch {
                print("Failed to clear \(entityName): \(error.localizedDescription)")
            }
        }

        do {
            try context.save()
        } catch {
            print("Failed to save context after clearing database: \(error.localizedDescription)")
        }
    }
}
