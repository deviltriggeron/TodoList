//
//  Entity.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/17/25.
//

import Foundation

struct Todos: Decodable, Identifiable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

struct Task: Decodable {
    let todos: [Todos]
    let total: Int
    let skip: Int
    let limit: Int
}
