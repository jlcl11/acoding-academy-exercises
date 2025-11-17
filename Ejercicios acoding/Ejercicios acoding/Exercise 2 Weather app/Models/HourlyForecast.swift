//
//  HourlyForecast.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import Foundation

struct HourlyForecast: Identifiable {
    let id = UUID()
    let time: String
    let icon: String
    let temp: Int
}

extension HourlyForecast {
    static let mocks = [
        HourlyForecast(time: "Now", icon: "sun.max.fill", temp: 18),
        HourlyForecast(time: "10:00", icon: "sun.max.fill", temp: 19),
        HourlyForecast(time: "11:00", icon: "cloud.sun.fill", temp: 20),
        HourlyForecast(time: "12:00", icon: "cloud.sun.fill", temp: 21),
        HourlyForecast(time: "13:00", icon: "sun.max.fill", temp: 22),
        HourlyForecast(time: "14:00", icon: "sun.max.fill", temp: 22),
        HourlyForecast(time: "15:00", icon: "cloud.fill", temp: 21),
        HourlyForecast(time: "16:00", icon: "cloud.fill", temp: 20)
    ]
}
