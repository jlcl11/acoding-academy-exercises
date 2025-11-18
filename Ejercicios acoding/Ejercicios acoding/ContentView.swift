//
//  ContentView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedView: String?
    
    // Array de tuplas mantiene el orden de inserción
    private let viewOptions: [(name: String, view: AnyView, icon: String)] = [
        ("Music Player", AnyView(MusicPlayer(song: Song(name: "Manchild", artist: "Sabrina Carpenter", songDuration: 213.0, songImage: .manchild))), "music.note"),
        ("Weather", AnyView(WeatherApp()), "cloud.sun.fill"),
        ("To Do", AnyView(ToDoView()), "checklist"),
        ("Face Card", AnyView(FaceCard(person: .example)), "person.crop.circle.fill"),
        ("Super Hero", AnyView(SuperHeroGridView()), "burst.fill")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewOptions, id: \.name) { option in
                    NavigationLink(value: option.name) {
                        HStack(spacing: 16) {
                            Image(systemName: option.icon)
                                .symbolRenderingMode(.multicolor)
                                .foregroundStyle(.gray, .yellow)
                                .font(.title2)
                                .frame(width: 40)
                            
                            Text(option.name)
                                .font(.headline)
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Apps")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: String.self) { viewName in
                viewOptions.first(where: { $0.name == viewName })?.view ?? AnyView(Text("View not found"))
            }
        }
    }
}
#Preview {
    ContentView()
}
