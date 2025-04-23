//
//  ListProtocols.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation
import SwiftUI
import CoreData

protocol ListViewProtocol {
    var viewState: ListViewState { get set }
}

protocol ListPresenterProtocol: ObservableObject {
    var viewState: (any ListViewStateProtocol)? { get set }
    var interactor: ListInteractorProtocol? { get set }
    var router: (any ListRouterProtocol)? { get set }
    var items: FetchedResults<TaskItem>? { get set }
    func clearDataStore()
    func retrieveTasks() throws -> FetchRequest<TaskItem>
}

protocol ListInteractorProtocol {
    var presenter: (any ListPresenterProtocol)? { get set }
    
    func retrieveTasks() throws -> FetchedResults<TaskItem>
    func clearDataStore()
}

protocol ListRouterProtocol {
    var presenter: (any ListPresenterProtocol)? { get set }
    associatedtype V: View
    func navigateToDetail() -> V
}

protocol ListViewStateProtocol: ObservableObject {
    var presenter: (any ListPresenterProtocol)? { get set }
}

protocol ListAssembliesProtocol {
    
    associatedtype ViewState = ListViewState
    associatedtype Presenter = ListPresenter
    associatedtype Interactor = ListInteractor
    associatedtype Router = ListRouter
    associatedtype View = ListView
    
    func build() -> View
    func assemble(view: ListView, viewState: ListViewState, presenter: ListPresenter, router: ListRouter, interactor: ListInteractor)
    
}
