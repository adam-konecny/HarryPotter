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
            CharactersList(viewModel: CharactersListViewModel(container: .init()))
        }
    }
}
