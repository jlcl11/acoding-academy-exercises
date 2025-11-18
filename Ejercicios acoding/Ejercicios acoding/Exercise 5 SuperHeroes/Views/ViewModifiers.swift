//
//  BadgeStyle.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI


// Hero Title Style Modifier
struct HeroTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(.white)
    }
}

// Hero Subtitle Style Modifier
struct HeroSubtitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(.white.opacity(0.9))
    }
}

// Section Title Style Modifier
struct SectionTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
    }
}

// Card Background Style Modifier
struct CardBackgroundStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: SuperHeroStyles.CornerRadius.large)
                    .fill(Color(.systemGray6))
            )
    }
}

// Circular Button Background Modifier
struct CircularButtonBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(SuperHeroStyles.Spacing.medium)
            .background(
                Circle()
                    .fill(.ultraThinMaterial)
            )
    }
}

// MARK: - View Extensions
extension View {
    func badgeStyle() -> some View {
        modifier(BadgeStyle())
    }
    
    func heroTitleStyle() -> some View {
        modifier(HeroTitleStyle())
    }
    
    func heroSubtitleStyle() -> some View {
        modifier(HeroSubtitleStyle())
    }
    
    func sectionTitleStyle() -> some View {
        modifier(SectionTitleStyle())
    }
    
    func cardBackground() -> some View {
        modifier(CardBackgroundStyle())
    }
    
    func circularButtonBackground() -> some View {
        modifier(CircularButtonBackground())
    }
}

// MARK: - Button Styles

struct GlassmorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .circularButtonBackground()
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct PowerRowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .cardBackground()
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Image Extensions

extension Image {
    
    func heroCardImage() -> some View {
        self
            .fullImage()
            .scaledToFill()
            .frame(width: SuperHeroStyles.Sizes.cardWidth, height: SuperHeroStyles.Sizes.cardHeight)
            .clipShape(RoundedRectangle(cornerRadius: SuperHeroStyles.CornerRadius.medium))
    }
    
    func heroHeaderImage() -> some View {
        self
            .fullImage()
            .scaledToFill()
            .frame(height: SuperHeroStyles.Sizes.heroImageHeight)
    }
    
    func powerIconImage() -> some View {
        self
            .font(.title3)
            .foregroundColor(.white)
    }
}

struct BadgeStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .fontWeight(.medium)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(.ultraThinMaterial)
            )
            .foregroundColor(.white)
    }
}
