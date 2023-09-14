//
//  PlanetListViewModel.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import Foundation
import Combine
import UIKit

class PlanetListViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @Published var errorMessage: String?
    @Published var isLoading = true

    private var cancellables: Set<AnyCancellable> = []
    
    init() {
    }
    
    func fetchPlanets() {
        print("fetchPlanets")
        PlanetDataModel.shared.fetchPlanets()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                }
            }, receiveValue: { [weak self] response in
                if let results = response?.results {
                    self?.planets = results
                    self?.isLoading = false
                }
            })
            .store(in: &cancellables)
    }
}
