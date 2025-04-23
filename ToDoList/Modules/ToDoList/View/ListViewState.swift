//
//  File.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/23/25.
//

import SwiftUI
import CoreData

final class ListViewState: ListViewStateProtocol, ObservableObject {

    var presenter: (any ListPresenterProtocol)?
//    var viewContext: NSManagedObjectContext
//    @Environment(\.managedObjectContext)var viewContext: NSManagedObjectContext
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
//        animation: .default)
//    var items: FetchedResults<TaskItem>
    
    func clearDatabase() {
        presenter?.clearDataStore()
    }
    
    func addItem() {
        
    }
    
    func retrieveTasks() throws -> FetchRequest<TaskItem>{
        return try presenter?.retrieveTasks()
    }
    
//    func addItem() {
//        withAnimation {
//            let newItem = TaskItem(context: presenter?.viewContext ?? <#default value#>)
//            newItem.dueDate = Date()
//
//            do {
//                try self.viewContext.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { self.items[$0] }.forEach(self.viewContext.delete)
//
//            do {
//                try self.viewContext.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//    
//    let itemFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .medium
//        return formatter
//    }()
//    
}
