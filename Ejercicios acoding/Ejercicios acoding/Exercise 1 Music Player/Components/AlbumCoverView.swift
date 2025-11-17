//
//  AlbumCoverView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct AlbumCoverView: View {
    let imageName: ImageResource
    
    var body: some View {
        Image(imageName)
            .fullImage()
    }
}

#Preview {
    AlbumCoverView(imageName: .manchild)
}
