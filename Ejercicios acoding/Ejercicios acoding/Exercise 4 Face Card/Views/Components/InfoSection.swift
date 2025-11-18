//
//  InfoSection.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct InfoSection: View {
    let person: Person
    
    var body: some View {
        VStack(spacing: 12) {
            ProfileInfoRow(
                icon: "briefcase.fill",
                label: "Occupation",
                value: person.occupation
            )
            
            ProfileInfoRow(
                icon: "building.2.fill",
                label: "Company",
                value: person.company
            )
            
            ProfileInfoRow(
                icon: "graduationcap.fill",
                label: "Education",
                value: person.education
            )
            
            ProfileInfoRow(
                icon: "ruler.fill",
                label: "Height",
                value: person.height
            )
        }
    }
}

#Preview {
    InfoSection(person: .example)
}
