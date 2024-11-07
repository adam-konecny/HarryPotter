//
//  SpellsList.swift
//  Harry Potter
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

struct SpellsList: View {
    @State var viewModel: SpellsListViewModel
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                switch viewModel.dataState {
                case .loading:
                    ProgressView()
                case .loaded(let spells):
                    ScrollView {
                        LazyVStack {
                            ForEach(spells, id: \.self) { spell in
                                Text(spell.name)
                            }
                        }
                    }
                case .error(let error):
                    Text(error.localizedDescription)
                }
            }
            .navigationTitle("Spells")
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
}
