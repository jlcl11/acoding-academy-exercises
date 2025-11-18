//
//  InterestChip.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct InterestChip: View {
    let interest: String
    
    var body: some View {
        Text(interest)
            .secondaryText(size: 14, weight: .medium)
            .chip()
    }
}

#Preview{
    InterestChip(interest: "Interest")
}
