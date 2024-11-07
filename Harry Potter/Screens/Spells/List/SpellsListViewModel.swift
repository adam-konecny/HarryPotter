//
//  SpellsListViewModel.swift
//  Harry Potter
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

@Observable
class SpellsListViewModel {
    @ObservationIgnored
    private let container: Container
    
    var dataState: DataState<[Spell]> = .loading
    
    init(container: Container) {
        self.container = container
    }
    
    func didAppear() {
        Task {
            await loadSpells()
        }
    }
    
    private func loadSpells() async {
        do {
            let spells = try await container.apiService.getSpells()
            
            dataState = .loaded(spells)
        } catch {
            dataState = .error(error)
        }
    }
}
