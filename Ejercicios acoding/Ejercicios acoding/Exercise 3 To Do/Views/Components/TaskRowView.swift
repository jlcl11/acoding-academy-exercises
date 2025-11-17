//
//  TaskRowView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct TaskRowView: View {
    let task: Task
    let onToggleComplete: () -> Void
    let onToggleFavorite: () -> Void
    
    var body: some View {
        HStack(spacing: ToDoConstants.sectionSpacing) {
            CompletionButton(
                isCompleted: task.isCompleted,
                action: onToggleComplete
            )
            
            TaskContent(task: task)
        }
        .taskRowContainer()
    }
}

#Preview("Normal Task") {
    TaskRowView(
        task: .sample,
        onToggleComplete: {},
        onToggleFavorite: {}
    )
    .padding()
}

 
