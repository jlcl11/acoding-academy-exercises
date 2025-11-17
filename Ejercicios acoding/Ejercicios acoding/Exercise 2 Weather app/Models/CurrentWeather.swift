//
//  CurrentWeather.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import Foundation

struct CurrentWeather {
    let location: String
    let temperature: Int
    let condition: String
    let high: Int
    let low: Int
    let description: String
}

extension CurrentWeather {
    static let mock = CurrentWeather(
        location: "Málaga",
        temperature: 18,
        condition: "Clear",
        high: 22,
        low: 15,
        description: "Clear sky conditions will continue throughout the day. Wind gusts up to 8 km/h."
    )
}
