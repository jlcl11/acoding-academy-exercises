//
//  ProfileHeader.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct ProfileHeader: View {
    let person: Person
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(person.imageResource)
                .profileHeaderImage()
                .profileHeaderOverlay()
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 8) {
                    Text(person.name)
                        .whiteTextFC(size: 34, weight: .bold)
                    
                    Text("\(person.age)")
                        .whiteTextFC(size: 34, weight: .bold)
                    
                }
                
                InterestGrid(interests: person.interests)
                
                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                        .font(.caption)
                    
                    Text("\(person.location) • \(person.distance) km away")
                        .whiteTextFC(size: 15, weight: .regular)
                }
            }
            .shadow(radius: 3)
            .padding(20)
        }
    }
}

#Preview {
    ProfileHeader(person: .example)
}
