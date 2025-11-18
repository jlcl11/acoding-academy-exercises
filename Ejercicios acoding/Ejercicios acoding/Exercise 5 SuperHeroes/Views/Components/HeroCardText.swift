//
//  HeroCardText.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct HeroCardText: View {
    let nickname: String
    let realName: String
    
    var body: some View {
        VStack {
            Text(nickname)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)
            
            Text(realName)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
    }
}

#Preview {
    HeroCardText(nickname: "Iron Man", realName: "Tony Stark")
}
