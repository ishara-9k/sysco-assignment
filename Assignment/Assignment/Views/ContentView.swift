//
//  ContentView.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlanetList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlanetListViewModel())
    }
}
