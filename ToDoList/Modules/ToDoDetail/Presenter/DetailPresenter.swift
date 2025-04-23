//
//  DetailPresenter.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol {
    
    var viewState: DetailViewStateProtocol?
    
    var interactor: DetailInteractorProtocol?
    
    var router: DetailRouterProtocol?

}
