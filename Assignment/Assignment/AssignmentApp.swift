//
//  AssignmentApp.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import SwiftUI

@main
struct AssignmentApp: App {
    @StateObject private var modelData = PlanetListViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
