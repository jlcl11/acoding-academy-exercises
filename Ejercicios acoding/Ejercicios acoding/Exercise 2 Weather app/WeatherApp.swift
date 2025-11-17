//
//  WeatherApp.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct WeatherApp: View {
    var body: some View {
        ZStack {
            WeatherBackground()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    CurrentWeatherView(weather: .mock)
                        .padding(.top, 60)
                        .padding(.bottom, 40)
                    
                    HourlyForecastCard(
                        forecasts: HourlyForecast.mocks,
                        description: CurrentWeather.mock.description
                    )
                    
                    DailyForecastCard(forecasts: DailyForecast.mocks)
                        .padding(.top, 16)
                    
                    Spacer(minLength: 40)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WeatherApp()
}
