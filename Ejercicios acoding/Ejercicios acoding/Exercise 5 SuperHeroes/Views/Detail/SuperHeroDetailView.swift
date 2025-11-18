//
//  SuperHeroDetailView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct SuperHeroDetailView: View {
    let hero: SuperHero
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HeroHeaderImage(hero: hero, dismiss: dismiss)
                HeroContent(hero: hero)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarHidden(true)
    }
}

extension SuperHeroDetailView {
    static let powerIcons: [String: String] = [
        "Telepathy": "brain.head.profile",
        "Flight": "airplane",
        "Super Strength": "figure.strengthtraining.traditional",
        "Invisibility": "eye.slash",
        "Teleportation": "arrow.left.arrow.right",
        "Time Manipulation": "clock.arrow.circlepath",
        "Elemental Control": "flame",
        "Duplication": "person.2",
        "Sound Imitation": "waveform",
        "Sound Amplification": "speaker.wave.3",
        "Vibration Generation": "wave.3.right",
        "Vibration Control": "waveform.path.ecg",
        "Light Manipulation": "light.max",
        "Light Emission": "sparkles",
        "Rapid Spin": "arrow.triangle.2.circlepath",
        "Tornado Creation": "tornado",
        "Earth Manipulation": "mountain.2",
        "Rock Creation": "square.stack.3d.up",
        "Weather Manipulation": "cloud.bolt.rain",
        "Mental Manipulation": "brain",
        "Invulnerability": "shield",
        "Metallic Skin": "shield.lefthalf.filled",
        "Water Manipulation": "drop",
        "Marine Life Communication": "fish",
        "Aquatic Form Transformation": "water.waves",
        "Shadow Manipulation": "moonphase.new.moon",
        "Shadow Teleportation": "moon.stars",
        "Regeneration": "heart.circle",
        "Fire Manipulation": "flame.fill"
    ]
}


#Preview {
    SuperHeroDetailView(hero: SUPERHEROES.first!)
}
