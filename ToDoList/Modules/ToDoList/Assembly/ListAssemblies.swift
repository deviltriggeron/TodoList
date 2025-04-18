//
//  ListAssemblies.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class ListAssemblies {
    
    typealias ViewState = ListViewState
    typealias Presenter = ListPresenter
    typealias Interactor = ListInteractor
    typealias Router = ListRouter
    typealias View = ListView
    
    func build() {
        let viewState = ViewState()
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()
        let view = View(viewState: viewState)
        
    }
    
}
