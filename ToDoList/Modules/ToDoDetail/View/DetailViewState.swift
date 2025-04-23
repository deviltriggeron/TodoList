//
//  DetailViewState.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class DetailViewState: ObservableObject, DetailViewStateProtocol {
    
    var presenter: DetailPresenterProtocol?
    var viewState: DetailViewState?
    
}
