//
//  TaskMetadata.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct TaskMetadata: View {
    let priority: Task.Priority
    let category: Task.Category
    let dueDate: Date?
    let isOverdue: Bool
    
    var body: some View {
        HStack(spacing: ToDoConstants.elementSpacing) {
            PriorityBadge(priority: priority)
            CategoryBadge(category: category)
            
            if let dueDate = dueDate {
                DueDateLabel(date: dueDate, isOverdue: isOverdue)
            }
        }
        .padding(.top, 2)
    }
}

#Preview  {
    TaskMetadata(
        priority: .high,
        category: .work,
        dueDate: Date().addingTimeInterval(86400),
        isOverdue: false
    )
    .padding()
}

 
