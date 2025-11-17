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
                .whiteText(size: 16)
                .padding(.horizontal, Constants.cardHorizontalPadding)
                .padding(.top, Constants.cardVerticalPadding)
            
            Divider()
                .cardDivider()
            
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
        .weatherCard()
    }
}

#Preview {
    ZStack {
        WeatherBackground()
        VStack {
            Spacer()
            HourlyForecastCard(
                forecasts: HourlyForecast.mocks,
                description: "Mostly cloudy conditions continuing for the next few hours."
            )
            Spacer()
        }
    }
    .ignoresSafeArea()
}
