//
//  BackButton.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct BackButton: View {
    let dismiss: DismissAction
    
    var body: some View {
        Button(action: { dismiss() }) {
            Image(systemName: "chevron.left")
        }
        .buttonStyle(GlassmorphicButtonStyle())
        .padding(.leading, 20)
        .padding(.top, 50)
    }
}
