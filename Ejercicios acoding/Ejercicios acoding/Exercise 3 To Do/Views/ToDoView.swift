//
//  ToDoView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct ToDoView: View {
    @State private var viewModel = TaskViewModel()
    @State private var showingAddSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            FilterButtonsRow(
                selectedFilter: viewModel.filterOption,
                onFilterTap: { filter in
                    withAnimation(.snappy) {
                        viewModel.setFilter(filter)
                    }
                }
            )
            
            ActionButtonsRow(
                selectedSort: viewModel.sortOption,
                onSortTap: { sort in
                    withAnimation(.snappy) {
                        viewModel.setSort(sort)
                    }
                },
                onNewTaskTap: {
                    showingAddSheet = true
                }
            )
            
            Divider()
            
            TaskListContent(
                tasksByCategory: viewModel.tasksByCategory,
                onToggleComplete: { task in
                    withAnimation(.snappy) {
                        viewModel.toggleCompletion(for: task)
                    }
                },
                onToggleFavorite: { task in
                    withAnimation(.snappy) {
                        viewModel.toggleFavorite(for: task)
                    }
                },
                onDelete: { task in
                    withAnimation(.snappy) {
                        viewModel.deleteTask(task)
                    }
                }
            )
        }
        .navigationTitle("My Tasks")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingAddSheet) {
            AddTaskSheet { newTask in
                viewModel.addTask(newTask)
            }
        }
    }
}


#Preview {
    NavigationStack {
        ToDoView()
    }
}
