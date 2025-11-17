//
//  TaskDescription.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct TaskDescription: View {
    let description: String
    
    var body: some View {
        Text(description)
            .subtitleText()
            .lineLimit(2)
    }
}

#Preview  {
    TaskDescription(description: "This is a short description")
        .padding()
}
 
