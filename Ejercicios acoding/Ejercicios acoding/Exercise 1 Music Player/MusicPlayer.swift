//
//  MusicPlayer.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 10/11/25.
//

import SwiftUI

struct MusicPlayer: View {
    @State private var songPlayedTime = 136.0
    @State private var volume = 0.7
    @State private var isPlaying = false
    @State private var isLiked = false
    let song: Song

    var body: some View {
        VStack(spacing: 0) {
            AlbumCoverView(imageName: song.songImage)

            PlayerControlsView(
                song: song,
                songPlayedTime: $songPlayedTime,
                volume: $volume,
                isPlaying: $isPlaying,
                isLiked: $isLiked
            )
        }
        .background(PlayerGradientBackground())
        .ignoresSafeArea()
    }
}

#Preview {
    MusicPlayer(
        song: Song(
            name: "Manchild",
            artist: "Sabrina Carpenter",
            songDuration: 213.0,
            songImage: .manchild
        )
    )
}
