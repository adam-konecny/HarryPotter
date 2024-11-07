//
//  CharactersList.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

struct CharactersList: View {
    @State var viewModel: CharactersListViewModel
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                switch viewModel.dataState {
                case .loading:
                    ProgressView()
                case .loaded(let characters):
                    ScrollView {
                        LazyVStack {
                            ForEach(characters, id: \.self) { character in
                                CharacterListItem(character: character)
                            }
                        }
                        .padding()
                    }
                case .error(let error):
                    Text(error.localizedDescription)
                        .padding()
                }
            }
            .navigationTitle("Characters")
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
}
