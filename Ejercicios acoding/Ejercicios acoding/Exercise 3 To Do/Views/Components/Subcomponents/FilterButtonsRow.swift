//
//  FilterButtonsRow.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct FilterButtonsRow: View {
    let selectedFilter: TaskViewModel.FilterOption
    let onFilterTap: (TaskViewModel.FilterOption) -> Void
    
    private let filters: [TaskViewModel.FilterOption] = [.all, .pending, .favorites]
    
    var body: some View {
        HStack(spacing: ToDoConstants.sectionSpacing) {
            ForEach(filters, id: \.self) { filter in
                FilterButton(
                    title: filter.rawValue,
                    isSelected: selectedFilter == filter
                ) {
                    onFilterTap(filter)
                }
            }
        }
        .filterButtonsContainer()
    }
}

#Preview {
    FilterButtonsRow(
        selectedFilter: .all,
        onFilterTap: { _ in }
    )
}
