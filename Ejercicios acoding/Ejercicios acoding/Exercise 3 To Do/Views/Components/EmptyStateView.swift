//
//  EmptyStateView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct EmptyStateView: View {
    let filterOption: TaskViewModel.FilterOption
    
    private var iconName: String {
        switch filterOption {
        case .all: return "checklist"
        case .pending: return "clock.badge.exclamationmark"
        case .completed: return "checkmark.circle"
        case .favorites: return "star"
        }
    }
    
    private var title: String {
        switch filterOption {
        case .all: return "No Tasks"
        case .pending: return "No Pending Tasks"
        case .completed: return "No Completed Tasks"
        case .favorites: return "No Favorite Tasks"
        }
    }
    
    private var message: String {
        switch filterOption {
        case .all: return "Tap the + button to create a new task"
        case .pending: return "All tasks are completed!"
        case .completed: return "No tasks have been completed yet"
        case .favorites: return "Mark tasks as favorites to see them here"
        }
    }
    
    var body: some View {
        VStack(spacing: ToDoConstants.sectionPadding) {
            Image(systemName: iconName)
                .emptyStateIcon()
            
            Text(title)
                .emptyStateTitle()
            
            Text(message)
                .emptyStateSubtitle()
        }
        .emptyStateContainer()
    }
}

#Preview  {
    EmptyStateView(filterOption: .all)
}
 
