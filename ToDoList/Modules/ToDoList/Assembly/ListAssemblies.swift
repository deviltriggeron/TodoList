//
//  ListAssemblies.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class ListAssemblies: ListAssembliesProtocol {    
    
    typealias Presenter = ListPresenter
    typealias Interactor = ListInteractor
    typealias Router = ListRouter
    typealias View = ListView
    
    func build() -> View {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()
        let viewState = ListViewState()
        let view = View(viewState: viewState)
        
        self.assemble(view: view, viewState: viewState, presenter: presenter, router: router, interactor: interactor)
        
        return view
    }
    
    func assemble(view: ListView, viewState: ListViewState, presenter: ListPresenter, router: ListRouter, interactor: ListInteractor) {
        
        viewState.presenter = presenter
        
        presenter.viewState = viewState
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        
    }
    
}
