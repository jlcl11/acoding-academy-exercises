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
    
    private var progressValue: Double {
        let range = CGFloat(high - low)
        let normalizedRange = (range - Constants.minTempRange) / (Constants.maxTempRange - Constants.minTempRange)
        let clampedRange = max(0, min(1, normalizedRange))
        return 0.3 + (clampedRange * 0.6)
    }
    
    var body: some View {
        ProgressView(value: progressValue, total: 1.0)
            .progressViewStyle(
                GradientProgressStyle(
                    gradient: LinearGradient(
                        colors: [.yellow, .orange, .red],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            )
            .frame(width: Constants.temperatureBarWidth, height: Constants.temperatureBarHeight)
    }
}


#Preview {
    ZStack {
        WeatherBackground()
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Rango pequeño (5°)")
                    .whiteText(size: 14, weight: .medium)
                HStack {
                    Text("18°").whiteText(size: 16)
                    TemperatureBar(low: 18, high: 23)
                    Text("23°").whiteText(size: 16)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Rango medio (10°)")
                    .whiteText(size: 14, weight: .medium)
                HStack {
                    Text("15°").whiteText(size: 16)
                    TemperatureBar(low: 15, high: 25)
                    Text("25°").whiteText(size: 16)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Rango grande (15°)")
                    .whiteText(size: 14, weight: .medium)
                HStack {
                    Text("12°").whiteText(size: 16)
                    TemperatureBar(low: 12, high: 27)
                    Text("27°").whiteText(size: 16)
                }
            }
        }
        .padding()
    }
    .ignoresSafeArea()
}
