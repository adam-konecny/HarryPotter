//
//  CharactersListViewModel.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

@Observable
class CharactersListViewModel {
    @ObservationIgnored
    private let container: Container
    
    var dataState: DataState<[Person]> = .loading
    
    init(container: Container) {
        self.container = container
    }
    
    func didAppear() {
        Task {
            await loadCharacters()
        }
    }
    
    private func loadCharacters() async {
        do {
            let books = try await container.apiService.getCharacters()
            
            dataState = .loaded(books)
        } catch {
            dataState = .error(error)
        }
    }
}
