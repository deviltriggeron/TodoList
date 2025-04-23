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
    
    var items: FetchedResults<TaskItem>?
    
    func clearDataStore() {
        interactor?.clearDataStore()
    }
    
    func retrieveTasks() throws -> FetchRequest<TaskItem> {
        return try interactor?.retrieveTasks()
    }
}
