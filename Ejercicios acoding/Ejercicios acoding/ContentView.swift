//
//  ContentView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Section() {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .padding()
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
                    .foregroundStyle(.black)
            }.backgroundStyle(.red)
            
       
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
