//
//  TaskListContent.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct TaskListContent: View {
    let tasksByCategory: [(category: Task.Category, tasks: [Task])]
    let onToggleComplete: (Task) -> Void
    let onToggleFavorite: (Task) -> Void
    let onDelete: (Task) -> Void
    
    var body: some View {
        List {
            ForEach(tasksByCategory, id: \.category) { categoryGroup in
                Section {
                    ForEach(categoryGroup.tasks) { task in
                        TaskRowView(
                            task: task,
                            onToggleComplete: {
                                onToggleComplete(task)
                            },
                            onToggleFavorite: {
                                onToggleFavorite(task)
                            }
                        )
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            FavoriteSwipeAction(
                                isFavorite: task.isFavorite,
                                action: {
                                    onToggleFavorite(task)
                                }
                            )
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            DeleteSwipeAction {
                                onDelete(task)
                            }
                        }
                    }
                } header: {
                    SectionHeader(category: categoryGroup.category)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview("With Tasks") {
    @Previewable @State var viewModel = TaskViewModel()
    
    TaskListContent(
        tasksByCategory: viewModel.tasksByCategory,
        onToggleComplete: { task in
            viewModel.toggleCompletion(for: task)
        },
        onToggleFavorite: { task in
            viewModel.toggleFavorite(for: task)
        },
        onDelete: { task in
            viewModel.deleteTask(task)
        }
    )
}
