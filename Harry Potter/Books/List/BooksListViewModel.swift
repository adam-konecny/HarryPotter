//
//  BooksListViewModel.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

@Observable
class BooksListViewModel {
    @ObservationIgnored
    private let container: Container
    
    var dataState: DataState<[Book]> = .loading
    
    init(container: Container) {
        self.container = container
    }
    
    func didAppear() {
        Task {
            await loadBooks()
        }
    }
    
    private func loadBooks() async {
        do {
            let books = try await container.apiService.getBooks().docs
            
            dataState = .loaded(books)
        } catch {
            dataState = .error(error)
        }
    }
}
