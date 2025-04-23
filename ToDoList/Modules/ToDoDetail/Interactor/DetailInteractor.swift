//
//  DetailInteractor.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class DetailInteractor: DetailInteractorProtocol {
    
    var presenter: DetailPresenterProtocol?
    var todoStore: PersistenceController = PersistenceController.shared
    
    func deleteTodo() {
        
    }
    
    func editTodo() {
        
    }
}
