//
//  PlanetDetail.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import SwiftUI

struct PlanetDetail: View {
    var planet: Planet
    @EnvironmentObject var planetData: PlanetListViewModel
    @State private var loadedImage: UIImage? = nil

    var body: some View {
        ScrollView {

            if let image = loadedImage {
                
                CircleImage(image:
                           Image(uiImage: image))
                .padding(.top,20)
                
            } else {
                ProgressView()
                    .onAppear {
                        loadImageFromUrl()
                    }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(planet.name)
                        .font(.title)
                }

                Divider()
                Text("Orbital Period")
                    .font(.title2)
                Text(planet.orbitalPeriod)
                Divider()
                Text("Gravity")
                    .font(.title2)
                Text(planet.gravity)
            }
            .padding()
                
        }
        .navigationTitle(planet.name)
        .navigationBarTitleDisplayMode(.inline)
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

struct PlanetDetail_Previews: PreviewProvider {
    static let planetDataModel = PlanetListViewModel()
    
    static var previews: some View {
        PlanetDetail(planet: PlanetListViewModel().planets[0])
            .environmentObject(planetDataModel)
    }
}
