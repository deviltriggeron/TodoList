//
//  Entity.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/17/25.
//

import Foundation
import CoreData

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

@objc(NewEntity)
public class NewEntity: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var completedDate: Date
    @NSManaged public var createdDate: Date
    @NSManaged public var desc: String
    @NSManaged public var dueDate: Date
    @NSManaged public var isCompleted: Bool
    @NSManaged public var scheduleTime: Bool
    
    convenience init(name: String, completedDate: Date, createdDate: Date, desc: String, dueDate: Date, isCompleted: Bool, scheduleTime: Bool) {
        self.init()
        self.id = UUID()
        self.name = name
        self.completedDate = completedDate
        self.createdDate = createdDate
        self.desc = desc
        self.dueDate = dueDate
        self.isCompleted = isCompleted
        self.scheduleTime = scheduleTime
    }
}
