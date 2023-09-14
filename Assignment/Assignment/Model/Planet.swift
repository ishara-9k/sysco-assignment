//
//  Planet.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import Foundation
import SwiftUI

struct Planet: Codable, Identifiable {
    let id = UUID()
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
    
    var imageUrl: URL? {
        if let planetID = planetID {
            print("https://picsum.photos/id/\(planetID)/600/600")
            return URL(string: "https://picsum.photos/id/\(planetID)/800/800")
        }
        return nil
    }
    
    var planetID: Int? {
        let components = URLComponents(string: url)
        if let path = components?.path {
            let pathComponents = path.split(separator: "/")
            if let lastPathComponent = pathComponents.last {
                return Int(lastPathComponent)
            }
        }
        return nil
    }
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created
        case edited
        case url
    }
}
