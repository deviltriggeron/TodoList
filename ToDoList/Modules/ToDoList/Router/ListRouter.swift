//
//  ListRouter.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import SwiftUI
import Foundation

final class ListRouter: ListRouterProtocol {
    
    var presenter: (any ListPresenterProtocol)?

    func navigateToDetail() -> some View {
        
        
        return EmptyView()
    }
    
}
