//
//  PlaybackControls.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct PlaybackControls: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        HStack(spacing: 60) {
            Button("") {}
                .buttonStyle(.navigation(systemImage: "backward.fill"))
            
            Button("") { isPlaying.toggle() }
                .buttonStyle(.reproduction(systemImage: isPlaying ? "pause.fill" : "play.fill"))
            
            Button("") {}
                .buttonStyle(.navigation(systemImage: "forward.fill"))
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    @Previewable @State var isPlaying: Bool = true
    
    PlaybackControls(isPlaying: $isPlaying)
        .padding()
        .background(Color.black)
}
