//
//  TimelineSlider.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct TimelineSlider: View {
    @Binding var currentTime: Double
    let duration: Double
    
    var body: some View {
        VStack(spacing: 6) {
            Slider(value: $currentTime, in: 0...duration)
                .whiteSliderStyle()
            
            HStack {
                Text(currentTime.asTimeString)
                    .timeCaption()
                
                Spacer()
                
                Text(duration.asTimeString)
                    .timeCaption()
            }
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    @Previewable @State var currentTime: Double = 125.0
    
    TimelineSlider(
        currentTime: $currentTime,
        duration: 245.0
    )
    .padding()
    .background(Color.black)
}
