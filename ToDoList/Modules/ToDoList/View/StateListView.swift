//
//  StateListView.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import Foundation

final class ListViewState: ListViewStateProtocol, ObservableObject {
    
    var presenter: ListPresenterProtocol?
    
}
