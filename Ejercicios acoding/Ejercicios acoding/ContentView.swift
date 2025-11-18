//
//  ContentView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedView: String?
    
    private var viewDictionary: [String: AnyView] {
        [
            "Music Player": AnyView(MusicPlayer(song: Song(name: "Manchild", artist: "Sabrina Carpenter", songDuration: 213.0, songImage: .manchild))),
            "Weather": AnyView(WeatherApp()),
            "To Do": AnyView(ToDoView()),
            "Face Card": AnyView(FaceCard(person: .example)),
            "Super Hero": AnyView(SuperHeroGridView())
        ]
    }
    
    private let iconDictionary: [String: String] = [
        "Music Player": "music.note",
        "Weather": "cloud.sun.fill",
        "To Do": "checklist",
        "Face Card": "person.crop.circle.fill",
        "Super Hero": "burst.fill"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(viewDictionary.keys.sorted()), id: \.self) { option in
                    NavigationLink(value: option) {
                        HStack(spacing: 16) {
                            Image(systemName: iconDictionary[option] ?? "app.fill")
                                .symbolRenderingMode(.multicolor)
                                .foregroundStyle(.gray, .yellow)
                                .font(.title2)
                                .foregroundStyle(.blue)
                                .frame(width: 40)
                            
                            Text(option)
                                .font(.headline)
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Apps")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: String.self) { viewName in
                viewDictionary[viewName] ?? AnyView(Text("View not found"))
            }
        }
    }
}
#Preview {
    ContentView()
}
