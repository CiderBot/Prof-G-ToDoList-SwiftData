//
//  ToDo.swift
//  ToDoList-SwiftData
//
//  Created by Steven Yung on 9/21/23.
//

import Foundation
import SwiftData

@Model
final class ToDo {
    @Attribute(.unique) var timestamp: Date
    var item: String
    var reminderIsOn: Bool
    var dueDate: Date
    var notes: String
    var isCompleted: Bool
    
    init(timestamp: Date = .now, 
         item: String = "",
         reminderIsOn: Bool = false,
         dueDate: Date = .now,
         notes: String = "",
         isCompleted: Bool = false)
    {
        self.timestamp = timestamp
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
}
