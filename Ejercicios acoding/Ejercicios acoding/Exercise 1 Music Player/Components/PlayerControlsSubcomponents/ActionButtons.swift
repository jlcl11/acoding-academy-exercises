//
//  ActionButtons.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct ActionButtons: View {
    var body: some View {
        HStack(spacing: 60) {
            Button("") {}
                .buttonStyle(.circled(systemImage: "dot.radiowaves.left.and.right"))
            
            Button("") {}
                .buttonStyle(.circled(systemImage: "airpods.pro"))
            
            Button("") {}
                .buttonStyle(.circled(systemImage: "list.bullet"))
        }
        .padding(.bottom, 8)
    }
}
