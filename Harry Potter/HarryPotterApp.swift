//
//  HarryPotterApp.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

@main
struct HarryPotterApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CharactersList(viewModel: CharactersListViewModel(container: .init()))
                    .tabItem {
                        Label {
                            Text("Characters")
                        } icon: {
                            Image(systemName: "person.3.fill")
                        }
                    }
                
                SpellsList(viewModel: SpellsListViewModel(container: .init()))
                    .tabItem {
                        Label {
                            Text("Spells")
                        } icon: {
                            Image(systemName: "wand.and.sparkles")
                        }
                    }
            }
        }
    }
}
