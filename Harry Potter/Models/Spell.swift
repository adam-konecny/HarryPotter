//
//  Spell.swift
//  Harry Potter
//
//  Created by Adam Konečný on 07.11.2024.
//

import Foundation

struct Spell: Decodable, Hashable {
    let name: String
    let use: String
    
    enum CodingKeys: String, CodingKey {
        case name = "spell"
        case use
    }
}
