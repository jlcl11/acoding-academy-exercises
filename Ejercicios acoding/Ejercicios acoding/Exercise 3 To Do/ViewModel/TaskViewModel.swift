//
//  TaskViewModel.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import Foundation
import SwiftUI
import Combine

@Observable
class TaskViewModel {
    var tasks: [Task] = Task.sampleTasks
    var filterOption: FilterOption = .all
    var sortOption: SortOption = .dueDate
    
    // MARK: - Enums
    
    enum FilterOption: String, CaseIterable {
        case all = "All"
        case pending = "Pending"
        case completed = "Completed"
        case favorites = "Favorites"
    }
    
    enum SortOption: String, CaseIterable {
        case dueDate = "Date"
        case priority = "Priority"
        case title = "Title"
        
        var icon: String {
            switch self {
            case .dueDate: return "calendar"
            case .priority: return "exclamationmark.circle"
            case .title: return "textformat"
            }
        }
    }
    
    // MARK: - Computed Properties
    
    var filteredAndSortedTasks: [Task] {
        sortTasks(filterTasks(tasks))
    }
    
    var tasksByCategory: [(category: Task.Category, tasks: [Task])] {
        let grouped = Dictionary(grouping: filteredAndSortedTasks) { $0.category }
        return Task.Category.allCases.compactMap { category in
            guard let categoryTasks = grouped[category], !categoryTasks.isEmpty else {
                return nil
            }
            return (category, categoryTasks)
        }
    }
    
    var isEmpty: Bool {
        filteredAndSortedTasks.isEmpty
    }
    
    var totalTasksCount: Int {
        tasks.count
    }
    
    var completedTasksCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    var pendingTasksCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var favoritesCount: Int {
        tasks.filter { $0.isFavorite }.count
    }
    
    var overdueTasksCount: Int {
        tasks.filter { $0.isOverdue }.count
    }
    
    // MARK: - Private Methods
    
    private func filterTasks(_ tasks: [Task]) -> [Task] {
        switch filterOption {
        case .all:
            return tasks
        case .pending:
            return tasks.filter { !$0.isCompleted }
        case .completed:
            return tasks.filter { $0.isCompleted }
        case .favorites:
            return tasks.filter { $0.isFavorite }
        }
    }
    
    private func sortTasks(_ tasks: [Task]) -> [Task] {
        switch sortOption {
        case .dueDate:
            return tasks.sorted { task1, task2 in
                guard let date1 = task1.dueDate, let date2 = task2.dueDate else {
                    return task1.dueDate != nil
                }
                return date1 < date2
            }
        case .priority:
            return tasks.sorted { task1, task2 in
                priorityValue(task1.priority) > priorityValue(task2.priority)
            }
        case .title:
            return tasks.sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
        }
    }
    
    private func priorityValue(_ priority: Task.Priority) -> Int {
        switch priority {
        case .high: return 3
        case .medium: return 2
        case .low: return 1
        }
    }
    
    // MARK: - Public Methods
    
    func toggleCompletion(for task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
    }
    
    func toggleFavorite(for task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isFavorite.toggle()
    }
    
    func deleteTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
    
    func addTask(_ task: Task) {
        tasks.insert(task, at: 0)
    }
    
    func updateTask(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index] = task
    }
    
    func setFilter(_ filter: FilterOption) {
        filterOption = filter
    }
    
    func setSort(_ sort: SortOption) {
        sortOption = sort
    }
    
    func isFilterSelected(_ filter: FilterOption) -> Bool {
        filterOption == filter
    }
    
    func isSortSelected(_ sort: SortOption) -> Bool {
        sortOption == sort
    }
}
