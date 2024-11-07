//
//  CharacterDetailViewModel.swift
//  Harry Potter
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

@Observable
class CharacterDetailViewModel {
    @ObservationIgnored
    let character: Person
    
    init(character: Person) {
        self.character = character
    }
}
