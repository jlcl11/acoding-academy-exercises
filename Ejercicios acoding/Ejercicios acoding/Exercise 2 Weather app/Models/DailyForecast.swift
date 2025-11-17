//
//  DailyForecast.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import Foundation

struct DailyForecast: Identifiable {
    let id = UUID()
    let day: String
    let icon: String
    let low: Int
    let high: Int
}

extension DailyForecast {
    static let mocks = [
        DailyForecast(day: "Today", icon: "sun.max.fill", low: 15, high: 22),
        DailyForecast(day: "Wed", icon: "cloud.sun.fill", low: 16, high: 24),
        DailyForecast(day: "Thu", icon: "cloud.fill", low: 14, high: 20),
        DailyForecast(day: "Fri", icon: "cloud.sun.fill", low: 15, high: 21),
        DailyForecast(day: "Sat", icon: "sun.max.fill", low: 16, high: 23),
        DailyForecast(day: "Sun", icon: "sun.max.fill", low: 17, high: 25),
        DailyForecast(day: "Mon", icon: "cloud.sun.fill", low: 16, high: 24),
        DailyForecast(day: "Tue", icon: "sun.max.fill", low: 18, high: 26),
        DailyForecast(day: "Wed", icon: "cloud.fill", low: 15, high: 22),
        DailyForecast(day: "Thu", icon: "cloud.sun.fill", low: 16, high: 23)
    ]
}
