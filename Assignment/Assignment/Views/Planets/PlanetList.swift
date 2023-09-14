//
//  PlanetList.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import SwiftUI

struct PlanetList: View {
    @EnvironmentObject var modelData: PlanetListViewModel
    
//    var allPlanets: [Planet]{
//        modelData.planets
//    }
    
    var body: some View {
        NavigationView{
            if modelData.isLoading {
                ProgressView()
            } else {
                List{
                    ForEach(modelData.planets){ planet in
                        NavigationLink{
                            PlanetDetail(planet:planet)
                        } label: {
                            PlanetRow(planet: planet)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Planets")
            }
        }
        .onAppear() {
            modelData.fetchPlanets()
        }
    }
}

struct PlanetList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            PlanetList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(PlanetListViewModel())
        }
    }
}
