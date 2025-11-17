//
//  SongInfoHeader.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct SongInfoHeader: View {
    let songName: String
    let artistName: String
    @Binding var isLiked: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(songName)
                    .songNameStyle()
                
                Text(artistName)
                    .artistNameStyle()
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Button("") { isLiked.toggle() }
                    .buttonStyle(.action(systemImage: isLiked ? "heart.fill" : "heart"))
                
                Button("") {}
                    .buttonStyle(.action(systemImage: "plus.circle"))
            }
        }
       
    }
}
