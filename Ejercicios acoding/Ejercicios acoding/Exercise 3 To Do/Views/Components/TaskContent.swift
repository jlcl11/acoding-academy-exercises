//
//  TaskContent.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct TaskContent: View {
    let task: Task
    
    private var showFavorite: Bool {
        task.isFavorite
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: ToDoConstants.smallSpacing) {
            HStack(spacing: ToDoConstants.elementSpacing) {
                TaskTitle(title: task.title, isCompleted: task.isCompleted)
                
                Spacer()
                
                if showFavorite {
                    FavoriteIcon()
                }
            }
            
            if task.hasDescription, let description = task.description {
                TaskDescription(description: description)
            }
            
            TaskMetadata(
                priority: task.priority,
                category: task.category,
                dueDate: task.dueDate,
                isOverdue: task.isOverdue
            )
        }
    }
}

#Preview  {
    TaskContent(task: .sample)
        .padding()
}
 
