//
//  ListPresenter.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import CoreData
import SwiftUI

final class ListPresenter: ListPresenterProtocol {

    var viewState: (any ListViewStateProtocol)?
    
    var interactor: ListInteractorProtocol?
    
    var router: (any ListRouterProtocol)?
    
    @Environment(\.managedObjectContext)var viewContext: NSManagedObjectContext
    
    var items: [NewEntity] = []
    
    func clearDataStore() {
        interactor?.clearDataStore()
    }
    
    func retrieveTasks() {
        print("asd")
        guard let tasks = interactor?.retrieveTasks() else {
            print("asd1")
            return
        }
        print("asd2")
        for task in tasks {
            items.append(NewEntity(name: task.name ?? "", completedDate: task.completedDate ?? Date(), createdDate: task.createdDate ?? Date(), desc: task.desc ?? "", dueDate: task.dueDate ?? Date(), isCompleted: task.isCompleted, scheduleTime: task.scheduleTime))
        }
        viewState?.items = items
    }
    
}
