//
//  DueDateLabel.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct DueDateLabel: View {
    let date: Date
    let isOverdue: Bool
    
    var body: some View {
        HStack(spacing: ToDoConstants.smallSpacing) {
            Image(systemName: "clock")
                .smallIcon()
            Text(date, style: .relative)
                .font(.caption2)
        }
        .overdueText(isOverdue: isOverdue)
    }
}

#Preview  {
    DueDateLabel(
        date: Date().addingTimeInterval(86400),
        isOverdue: false
    )
    .padding()
}
