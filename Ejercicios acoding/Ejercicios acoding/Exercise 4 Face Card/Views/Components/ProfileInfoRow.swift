//
//  ProfileInfoRow.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct ProfileInfoRow: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: icon)
                .secondaryText(size: 18, weight: .regular)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .secondaryText(size: 13, weight: .regular)
                
                Text(value)
                    .primaryText(size: 16, weight: .medium)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ProfileInfoRow( icon: "briefcase.fill", label: "Occupation", value: "iOS Developer")
}
