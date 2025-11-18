//
//  Styles.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

// MARK: - Text Styles
struct PrimaryTextStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(.primary)
    }
}

struct SecondaryTextStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(.secondary)
    }
}

struct WhiteTextStyleFC: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(.white)
    }
}

// MARK: - Card Styles
struct GlassCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct ChipStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(.thinMaterial, in: Capsule())
    }
}

// MARK: - View Extensions
extension View {
    func primaryText(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(PrimaryTextStyle(size: size, weight: weight))
    }
    
    func secondaryText(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(SecondaryTextStyle(size: size, weight: weight))
    }
    
    func whiteTextFC(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(WhiteTextStyleFC(size: size, weight: weight))
    }
    
    func glassCard() -> some View {
        modifier(GlassCardStyle())
    }
    
    func chip() -> some View {
        modifier(ChipStyle())
    }

}

// MARK: - Image Modifiers
extension Image {
    func profileHeaderImage(height: CGFloat = 500) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: height)
            .clipped()
    }
}

struct ProfileHeaderOverlayModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay {
                LinearGradient(
                    colors: [.clear, .clear, .black.opacity(0.7)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
    }
}

extension ViewModifier where Self == ProfileHeaderOverlayModifier {
    static var profileHeaderOverlay: Self {
        ProfileHeaderOverlayModifier()
    }
}

extension View {
    func profileHeaderOverlay() -> some View {
        self.modifier(.profileHeaderOverlay)
    }
}

