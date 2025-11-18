//
//  DeleteSwipeAction.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct DeleteSwipeAction: View {
    let action: () -> Void
    
    var body: some View {
        Button(role: .destructive) {
            action()
        } label: {
            Label("Delete", systemImage: "trash.fill")
        }
    }
}

#Preview {
    List {
        Text("Task 1")
            .swipeActions(edge: .trailing) {
                DeleteSwipeAction(action: {})
            }
    }
}
