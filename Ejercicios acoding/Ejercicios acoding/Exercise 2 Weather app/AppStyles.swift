//
//  Styles.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct WhiteTextStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(.white)
    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: Constants.cardCornerRadius))
            .padding(.horizontal, Constants.cardHorizontalPadding)
    }
}

struct CardDividerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white.opacity(0.3))
            .padding(.horizontal, Constants.cardHorizontalPadding)
    }
}

struct WeatherIconStyle: ViewModifier {
    let size: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
            .foregroundStyle(color)
            .symbolRenderingMode(.hierarchical)
    }
}

struct GradientProgressStyle: ProgressViewStyle {
    let gradient: LinearGradient
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(.white.opacity(0.3))
            
            Capsule()
                .fill(gradient)
                .scaleEffect(x: configuration.fractionCompleted ?? 0, y: 1, anchor: .leading)
        }
    }
}

extension View {
    func whiteText(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(WhiteTextStyle(size: size, weight: weight))
    }
    
    func weatherCard() -> some View {
        modifier(CardStyle())
    }
    
    func cardDivider() -> some View {
        modifier(CardDividerStyle())
    }
    
    func weatherIcon(size: CGFloat = 24, color: Color = .yellow) -> some View {
        modifier(WeatherIconStyle(size: size, color: color))
    }
}
