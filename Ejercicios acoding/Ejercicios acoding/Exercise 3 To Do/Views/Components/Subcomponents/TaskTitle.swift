//
//  TaskTitle.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct TaskTitle: View {
    let title: String
    let isCompleted: Bool
    
    var body: some View {
        Text(title)
            .titleText()
            .strikethroughText(isActive: isCompleted)
    }
}

#Preview  {
    TaskTitle(title: "Buy groceries", isCompleted: false)
        .padding()
}
