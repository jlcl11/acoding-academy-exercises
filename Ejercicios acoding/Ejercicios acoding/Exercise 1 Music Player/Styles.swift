//
//  Styles.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 10/11/25.
//

import SwiftUI

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

struct ReproductionButton: ButtonStyle {
    var systemImage: String
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.25))
                .frame(width: 70, height: 70)

            Image(
                systemName: systemImage
            )
            .font(.system(size: 28))
            .foregroundStyle(.white)
        }
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

struct ActionButton: ButtonStyle {
    let systemImage: String
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: systemImage)
            .font(.title3)
            .foregroundStyle(.white.opacity(0.9))
    }
}

extension Double {
    var asTimeString: String {
        let minutes = Int(self) / 60
        let secs = Int(self) % 60
        return "\(minutes.formatted()):\(secs.formatted(.number.precision(.integerLength(2))))"
    }
}

 extension Slider {
    func whiteSliderStyle() -> some View {
        self
            .tint(.white)
            .sliderThumbVisibility(.hidden)
    }
}

extension Image {
    func fullImage() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
    }
    
    func speakerImage() -> some View {
        self
            .font(.caption)
            .foregroundStyle(.white.opacity(0.7))
    }
}

extension Text {
    func songNameStyle() -> some View {
        self
            .font(.title2)
            .bold()
            .fontWeight(.semibold)
            .foregroundStyle(.white)
    }
    
    func artistNameStyle() -> some View {
        self
            .font(.body)
            .foregroundStyle(.white.opacity(0.7))
    }
    
    func timeCaption() -> some View {
        self
            .font(.caption)
            .foregroundStyle(.white.opacity(0.6))
    }
}
