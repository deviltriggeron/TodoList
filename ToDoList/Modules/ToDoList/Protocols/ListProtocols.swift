//
//  ListProtocols.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

protocol ListViewStateProtocol {
    var presenter: ListPresenterProtocol? { get set }
}

protocol ListPresenterProtocol {
    var viewState: ListViewStateProtocol? { get set }
    var interactor: ListInteractorProtocol? { get set }
    var router: ListRouterProtocol? { get set }
}

protocol ListInteractorProtocol {
    var presenter: ListPresenterProtocol? { get set }
}

protocol ListRouterProtocol {
    func navigateToList()
}

