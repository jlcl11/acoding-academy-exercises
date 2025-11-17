//
//  PlayerControlsView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct PlayerControlsView: View {
    let song: Song
    @Binding var songPlayedTime: Double
    @Binding var volume: Double
    @Binding var isPlaying: Bool
    @Binding var isLiked: Bool
    
    var body: some View {
        VStack() {
            SongInfoHeader(
                songName: song.name,
                artistName: song.artist,
                isLiked: $isLiked
            )
            
            TimelineSlider(
                currentTime: $songPlayedTime,
                duration: song.songDuration
            )
            
            PlaybackControls(isPlaying: $isPlaying)
            
            VolumeControl(volume: $volume)
            
            ActionButtons()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 30)
    }
}
