//
//  HourlyForecastCard.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct HourlyForecastCard: View {
    let forecasts: [HourlyForecast]
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(description)
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .padding(.horizontal, Constants.cardHorizontalPadding)
                .padding(.top, Constants.cardVerticalPadding)
            
            Divider()
                .background(Color.white.opacity(0.3))
                .padding(.horizontal, Constants.cardHorizontalPadding)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: Constants.hourlyItemSpacing) {
                    ForEach(forecasts) { forecast in
                        HourlyWeatherView(forecast: forecast)
                    }
                }
                .padding(.horizontal, Constants.cardHorizontalPadding)
            }
            .padding(.bottom, Constants.cardVerticalPadding)
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cardCornerRadius))
        .padding(.horizontal, Constants.cardHorizontalPadding)
    }
}
