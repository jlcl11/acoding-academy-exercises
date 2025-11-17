//
//  DailyForecastCard.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct DailyForecastCard: View {
    let forecasts: [DailyForecast]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "calendar")
                    .font(.system(size: 12))
                    .foregroundStyle(.white.opacity(0.7))
                Text("10-DAY FORECAST")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.7))
            }
            .padding(.horizontal, Constants.cardHorizontalPadding)
            .padding(.top, Constants.cardVerticalPadding)
            
            Divider()
                .background(Color.white.opacity(0.3))
                .padding(.horizontal, Constants.cardHorizontalPadding)
            
            VStack(spacing: 8) {
                ForEach(Array(forecasts.enumerated()), id: \.element.id) { index, forecast in
                    if index > 0 {
                        Divider()
                            .background(Color.white.opacity(0.3))
                            .padding(.horizontal, Constants.cardHorizontalPadding)
                    }
                    DailyForecastRow(forecast: forecast)
                }
            }
            .padding(.bottom, Constants.cardVerticalPadding)
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cardCornerRadius))
        .padding(.horizontal, Constants.cardHorizontalPadding)
    }
}
