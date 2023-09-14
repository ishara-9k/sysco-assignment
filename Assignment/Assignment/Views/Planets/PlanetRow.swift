//
//  PlanetRow.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import SwiftUI

struct PlanetRow: View {
    var planet: Planet
    @State private var loadedImage: UIImage? = nil
    
    var body: some View {
        HStack {
            if let image = loadedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } else {
                ProgressView()
                    .onAppear {
                        loadImageFromUrl()
                    }
            }
            VStack(alignment: .leading) {
                Text(planet.name)
                Text(planet.climate)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
    
    private func loadImageFromUrl() {
        guard let imageUrl = planet.imageUrl else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.loadedImage = loadedImage
                }
            }
        }.resume()
    }
}

struct PlanetRow_Previews: PreviewProvider {
    static var planets = PlanetListViewModel().planets

    static var previews: some View {
        Group {
            PlanetRow(planet: planets[0])
            PlanetRow(planet: planets[1])
                
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
