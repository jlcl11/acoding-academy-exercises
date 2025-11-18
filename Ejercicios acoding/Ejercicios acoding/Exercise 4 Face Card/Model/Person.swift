//
//  Person.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct Person: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let age: Int
    let bio: String
    let occupation: String
    let location: String
    let company: String
    let education: String
    let height: String
    let imageResource: ImageResource
    let interests: [String]
    let distance: Int
}

extension Person {
    static let example = Person(
        name: "José Luis",
        age: 22,
        bio: "Coffee lover and sunset chaser. Always looking for new adventures and good conversations.",
        occupation: "App Manager",
        location: "Málaga",
        company: "Coffee King",
        education: "Apple Coding Academy",
        height: "6'0\"",
        imageResource: .selfie,
        interests: ["Videogames", "Travel", "Coding"],
        distance: 3
    )
}
