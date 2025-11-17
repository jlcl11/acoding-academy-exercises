//
//  Styles.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 10/11/25.
//

import SwiftUI

// MARK: - Button Styles

struct CircledButton: ButtonStyle {
    var systemImage: String

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.2))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: systemImage)
                        .font(.system(size: 18))
                        .foregroundStyle(.white.opacity(0.8))
                }
        }
    }
}

extension ButtonStyle where Self == CircledButton {
    static func circled(systemImage: String) -> Self {
        CircledButton(systemImage: systemImage)
    }
}

struct ReproductionButton: ButtonStyle {
    var systemImage: String
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.25))
                .frame(width: 70, height: 70)

            Image(systemName: systemImage)
                .font(.system(size: 28))
                .foregroundStyle(.white)
        }
    }
}

extension ButtonStyle where Self == ReproductionButton {
    static func reproduction(systemImage: String) -> Self {
        ReproductionButton(systemImage: systemImage)
    }
}

struct PreviousAndFollowingButton: ButtonStyle {
    var systemImage: String
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: systemImage)
            .font(.system(size: 32))
            .foregroundStyle(.white)
    }
}

extension ButtonStyle where Self == PreviousAndFollowingButton {
    static func navigation(systemImage: String) -> Self {
        PreviousAndFollowingButton(systemImage: systemImage)
    }
}

struct ActionButton: ButtonStyle {
    let systemImage: String
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: systemImage)
            .font(.title3)
            .foregroundStyle(.white.opacity(0.9))
    }
}

extension ButtonStyle where Self == ActionButton {
    static func action(systemImage: String) -> Self {
        ActionButton(systemImage: systemImage)
    }
}

// MARK: - Image Modifiers

extension Image {
    func fullImage() -> some View {
        self
            .resizable()
            .clipped()
    }
}

struct SpeakerImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.white.opacity(0.7))
    }
}

extension ViewModifier where Self == SpeakerImageModifier {
    static var speakerImage: Self {
        SpeakerImageModifier()
    }
}

extension Image {
    func speakerImage() -> some View {
        self.modifier(.speakerImage)
    }
}

// MARK: - Text Styles

struct SongNameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .bold()
            .fontWeight(.semibold)
            .foregroundStyle(.white)
    }
}

extension ViewModifier where Self == SongNameModifier {
    static var songName: Self {
        SongNameModifier()
    }
}

extension View {
    func songNameStyle() -> some View {
        modifier(.songName)
    }
}

struct ArtistNameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(.white.opacity(0.7))
    }
}

extension ViewModifier where Self == ArtistNameModifier {
    static var artistName: Self {
        ArtistNameModifier()
    }
}

extension View {
    func artistNameStyle() -> some View {
        modifier(.artistName)
    }
}

struct TimeCaptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.white.opacity(0.6))
    }
}

extension ViewModifier where Self == TimeCaptionModifier {
    static var timeCaption: Self {
        TimeCaptionModifier()
    }
}

extension View {
    func timeCaption() -> some View {
        modifier(.timeCaption)
    }
}

// MARK: - Slider Styles

struct WhiteSliderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.white)
            .sliderThumbVisibility(.hidden)
    }
}

extension ViewModifier where Self == WhiteSliderModifier {
    static var whiteSlider: Self {
        WhiteSliderModifier()
    }
}

extension Slider {
    func whiteSliderStyle() -> some View {
        modifier(.whiteSlider)
    }
}

// MARK: - Extensions

extension Double {
    var asTimeString: String {
        let minutes = Int(self) / 60
        let secs = Int(self) % 60
        return "\(minutes.formatted()):\(secs.formatted(.number.precision(.integerLength(2))))"
    }
}
