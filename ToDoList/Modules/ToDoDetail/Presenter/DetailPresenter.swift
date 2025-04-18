//
//  DetailPresenter.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class DetailPresenter: PresenterProtocol {
    
    var router: RouterProtocol
    var viewState: ViewStateProtocol
    var interactor: InteractorProtocol
    
    init(router: RouterProtocol, viewState: ViewStateProtocol, interactor: InteractorProtocol) {
        self.router = router
        self.viewState = viewState
        self.interactor = interactor
    }
    
}
