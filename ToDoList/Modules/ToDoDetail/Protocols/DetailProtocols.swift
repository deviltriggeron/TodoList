//
//  DetailProtocols.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/17/25.
//

import Foundation

protocol DetailViewStateProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    var viewState: DetailViewState? { get set }
}

protocol DetailPresenterProtocol {
    var viewState: DetailViewStateProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
}

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? { get set }
}

protocol DetailRouterProtocol {
    
    func navigateToDetail()
    
}
