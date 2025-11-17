//
//  PriorityBadge.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct PriorityBadge: View {
    let priority: Task.Priority
    
    var body: some View {
        Text(priority.rawValue)
            .priorityBadge(color: Color.priorityColor(for: priority))
    }
}

#Preview {
    PriorityBadge(priority: .high)
        .padding()
}
