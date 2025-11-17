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
        NavigationStack {
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
                
                taskListContent
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
    
    // MARK: - Task List Content
    
    @ViewBuilder
    private var taskListContent: some View {
        if viewModel.isEmpty {
            EmptyStateView(filterOption: viewModel.filterOption)
        } else {
            List {
                ForEach(viewModel.tasksByCategory, id: \.category) { categoryGroup in
                    Section {
                        ForEach(categoryGroup.tasks) { task in
                            TaskRowView(
                                task: task,
                                onToggleComplete: {
                                    withAnimation(.snappy) {
                                        viewModel.toggleCompletion(for: task)
                                    }
                                },
                                onToggleFavorite: {
                                    withAnimation(.snappy) {
                                        viewModel.toggleFavorite(for: task)
                                    }
                                }
                            )
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                favoriteSwipeAction(for: task)
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                deleteSwipeAction(for: task)
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
    
    // MARK: - Swipe Actions
    
    private func favoriteSwipeAction(for task: Task) -> some View {
        Button {
            withAnimation(.snappy) {
                viewModel.toggleFavorite(for: task)
            }
        } label: {
            Label(
                "Favorite",
                systemImage: task.isFavorite ? "star.slash.fill" : "star.fill"
            )
        }
        .tint(.yellow)
    }
    
    private func deleteSwipeAction(for task: Task) -> some View {
        Button(role: .destructive) {
            withAnimation(.snappy) {
                viewModel.deleteTask(task)
            }
        } label: {
            Label("Delete", systemImage: "trash.fill")
        }
    }
}

#Preview  {
    ToDoView()
}

 
