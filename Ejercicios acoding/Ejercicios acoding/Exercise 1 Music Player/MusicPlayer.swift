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

            Image(song.songImage)
                .fullImage()

            VStack(spacing: 16) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(song.name)
                            .songNameStyle()

                        Text(song.artist)
                            .artistNameStyle()
                    }

                    Spacer()

                    HStack(spacing: 20) {
                        Button("") { isLiked.toggle() }
                            .buttonStyle(ActionButton(systemImage: isLiked ? "heart.fill" : "heart"))

                        Button("") {}
                            .buttonStyle(ActionButton(systemImage: "plus.circle"))
                    }
                }
                .padding(.top, 4)
                .padding(.bottom, 8)

                VStack(spacing: 6) {
                    Slider(value: $songPlayedTime, in: 0...song.songDuration)
                        .whiteSliderStyle()

                    HStack {
                        Text(songPlayedTime.asTimeString)
                            .timeCaption()

                        Spacer()

                        Text(song.songDuration.asTimeString)
                        .timeCaption()
                    }
                }
                .padding(.bottom, 16)

                HStack(spacing: 60) {
                    Button("") {}
                        .buttonStyle(PreviousAndFollowingButton(systemImage: "backward.fill"))

                    Button("") {
                        isPlaying.toggle()
                    }.buttonStyle(ReproductionButton(systemImage: isPlaying ? "pause.fill" : "play.fill"))

                    Button("") {}
                        .buttonStyle(PreviousAndFollowingButton(systemImage: "forward.fill"))
                }
                .padding(.bottom, 20)

                HStack(spacing: 12) {
                    Image(systemName: "speaker.fill")
                        .speakerImage()

                    Slider(value: $volume, in: 0...1)
                        .whiteSliderStyle()

                    Image(systemName: "speaker.wave.3.fill")
                        .speakerImage()
                }
                .padding(.bottom, 12)

                HStack(spacing: 60) {
                    Button("") {}
                        .buttonStyle(CircledButton(systemImage: "dot.radiowaves.left.and.right"))

                    Button("") {}
                        .buttonStyle(CircledButton(systemImage: "airpods.pro"))

                    Button("") {}
                        .buttonStyle(CircledButton(systemImage: "list.bullet"))
                }
                .padding(.bottom, 8)
            }

            .padding(.horizontal, 24)
            .padding(.vertical, 30)

        }.background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 28 / 255, green: 25 / 255, blue: 19 / 255),
                    Color(red: 0.85, green: 0.82, blue: 0.75),
                    Color(red: 0.58, green: 0.60, blue: 0.62),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
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
