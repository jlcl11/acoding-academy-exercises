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
                .cardDivider()
            
            VStack(spacing: 8) {
                ForEach(Array(forecasts.enumerated()), id: \.element.id) { index, forecast in
                    if index > 0 {
                        Divider()
                            .cardDivider()
                    }
                    DailyForecastRow(forecast: forecast)
                }
            }
            .padding(.bottom, Constants.cardVerticalPadding)
        }
        .weatherCard()
    }
}

#Preview {
    ZStack {
        WeatherBackground()
        VStack {
            Spacer()
            DailyForecastCard(forecasts: DailyForecast.mocks)
            Spacer()
        }
    }
    .ignoresSafeArea()
}
