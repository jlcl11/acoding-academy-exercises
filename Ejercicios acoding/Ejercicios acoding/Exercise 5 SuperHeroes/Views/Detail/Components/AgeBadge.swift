//
//  AgeBadge.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct AgeBadge: View {
    let age: Int
    
    var body: some View {
        Text("\(age) years")
            .badgeStyle()
    }
}
