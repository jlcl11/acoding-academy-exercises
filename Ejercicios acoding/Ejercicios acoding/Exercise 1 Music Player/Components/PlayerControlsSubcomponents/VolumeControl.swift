//
//  VolumeControl.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct VolumeControl: View {
    @Binding var volume: Double
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "speaker.fill")
                .speakerImage()
            
            Slider(value: $volume, in: 0...1)
                .whiteSliderStyle()
            
            Image(systemName: "speaker.wave.3.fill")
                .speakerImage()
        }
        .padding(.bottom, 12)
    }
}

#Preview {
    @Previewable @State var volume: Double = 0.65
    
    VolumeControl(volume: $volume)
        .padding()
        .background(Color.black)
}
