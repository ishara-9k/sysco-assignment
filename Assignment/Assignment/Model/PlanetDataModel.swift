//
//  PlanetData.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import Foundation
import Combine

class PlanetDataModel {
    static let shared = PlanetDataModel()
    
    private init() { }
    
    func fetchPlanets() -> AnyPublisher<PlanetResponse?, Error> {
        guard let url = URL(string: "https://swapi.dev/api/planets") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PlanetResponse?.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

struct PlanetResponse: Codable {
    let results: [Planet]
}


