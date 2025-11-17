//
//  ActionButtonsRow.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct ActionButtonsRow: View {
    let selectedSort: TaskViewModel.SortOption
    let onSortTap: (TaskViewModel.SortOption) -> Void
    let onNewTaskTap: () -> Void
    
    var body: some View {
        HStack(spacing: ToDoConstants.sectionSpacing) {
            Menu {
                ForEach(TaskViewModel.SortOption.allCases, id: \.self) { option in
                    Button {
                        onSortTap(option)
                    } label: {
                        Label(
                            option.rawValue,
                            systemImage: selectedSort == option ? "checkmark" : ""
                        )
                    }
                }
            } label: {
                SecondaryButton(
                    icon: "arrow.up.arrow.down",
                    title: "Sort"
                )
            }
            
            Button {
                onNewTaskTap()
            } label: {
                SecondaryButton(
                    icon: "square.and.pencil",
                    title: "New Task"
                )
            }
        }
        .actionButtonsContainer()
    }
}

#Preview  {
    ActionButtonsRow(
        selectedSort: .dueDate,
        onSortTap: { _ in },
        onNewTaskTap: {}
    )
}
