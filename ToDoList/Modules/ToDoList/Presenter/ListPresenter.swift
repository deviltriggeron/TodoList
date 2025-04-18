//
//  ListPresenter.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class ListPresenter: ListPresenterProtocol {
    
    var viewState: ListViewStateProtocol?
    
    var interactor: ListInteractorProtocol?
    
    var router: ListRouterProtocol?
    
    
}
