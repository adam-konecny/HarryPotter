//
//  BooksList.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

struct BooksList: View {
    @State var viewModel: BooksListViewModel
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                switch viewModel.dataState {
                case .loading:
                    ProgressView()
                case .loaded(let books):
                    ScrollView {
                        LazyVStack {
                            ForEach(books, id: \.self) { book in
                                Text(book.title)
                            }
                        }
                    }
                case .error(let error):
                    Text(error.localizedDescription)
                }
            }
            .navigationTitle("Harry Potter")
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
}
