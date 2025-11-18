//
//  AboutSection.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct AboutSection: View {
    let bio: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("About")
                .primaryText(size: 20, weight: .semibold)
            
            Text(bio)
                .secondaryText(size: 16, weight: .regular)
                .lineSpacing(4)
        }
    }
}

#Preview {
    AboutSection(bio: "Hellow")
}
