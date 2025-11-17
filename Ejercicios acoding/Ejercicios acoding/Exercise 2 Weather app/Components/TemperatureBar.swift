//
//  TemperatureBar.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct TemperatureBar: View {
    let low: Int
    let high: Int
    
    private var gradientWidth: CGFloat {
        let range = CGFloat(high - low)

        let normalizedRange = (range - Constants.minTempRange) / (Constants.maxTempRange - Constants.minTempRange)
        let clampedRange = max(0, min(1, normalizedRange))
        
        let percentage = 0.3 + (clampedRange * 0.6)
        
        return Constants.temperatureBarWidth * percentage
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(.white.opacity(0.3))
                .frame(width: Constants.temperatureBarWidth, height: Constants.temperatureBarHeight)
            
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [.yellow, .orange, .red],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: gradientWidth, height: Constants.temperatureBarHeight)
        }
        .frame(width: Constants.temperatureBarWidth, height: Constants.temperatureBarHeight)
    }
}
