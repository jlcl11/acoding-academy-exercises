//
//  InterestGrid.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct InterestGrid: View {
    let interests: [String]
    
    var body: some View {
      
        HStack {
            ForEach(interests, id: \.self) { interest in
                InterestChip(interest: interest)
            }
        }
    
    }
}

#Preview {
    InterestGrid(interests: ["Coding", "Videogames"])
}
