//
//  SuperHeroStyles.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct SuperHeroStyles {
    // Colors
    struct Colors {
        static let powerIconGradient = LinearGradient(
            gradient: Gradient(colors: [.blue.opacity(0.6), .purple.opacity(0.6)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        static let imageGradient = LinearGradient(
            gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    // Spacing
    struct Spacing {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
    }
    
    // Sizes
    struct Sizes {
        static let cardWidth: CGFloat = 150
        static let cardHeight: CGFloat = 150
        static let heroImageHeight: CGFloat = 400
        static let powerIconSize: CGFloat = 50
        static let backButtonSize: CGFloat = 12
    }
    
    // Corner Radius
    struct CornerRadius {
        static let small: CGFloat = 10
        static let medium: CGFloat = 15
        static let large: CGFloat = 16
    }
}
