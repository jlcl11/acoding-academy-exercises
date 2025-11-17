//
//  TaskPreviewCard.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct TaskPreviewCard: View {
    let title: String
    let description: String?
    let priority: Task.Priority
    let category: Task.Category
    let dueDate: Date?
    let isFavorite: Bool
    
    private var task: Task {
        Task(
            title: title,
            description: description,
            isCompleted: false,
            isFavorite: isFavorite,
            priority: priority,
            dueDate: dueDate,
            category: category
        )
    }
    
    var body: some View {
        HStack(spacing: ToDoConstants.sectionSpacing) {
            Image(systemName: "circle")
                .taskIcon(color: .secondary)
            
            TaskContent(task: task)
        }
        .previewCardContainer()
    }
}

#Preview  {
    TaskPreviewCard(
        title: "Sample Task",
        description: "This is a description",
        priority: .high,
        category: .work,
        dueDate: Date().addingTimeInterval(86400),
        isFavorite: true
    )
    .padding()
}
 
