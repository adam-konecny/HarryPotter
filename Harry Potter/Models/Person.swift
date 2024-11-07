//
//  Person.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

struct Person: Decodable, Hashable {
    let fullName: String
    let nickname: String
    let hogwartsHouse: String
    let interpretedBy: String
    let children: [String]
    let image: String
    let birthdate: Date
    
    static var random: Self {
        .init(
            fullName: ["Ronald Weasly", "Harry Potter", "Hermione Granger"].randomElement()!,
            nickname: ["Ron", "Harry", "Hermione"].randomElement()!,
            hogwartsHouse: "Griffindor",
            interpretedBy: "Daniel Radcliffe",
            children: ["Fred Weasley", "George Weasley", "Luna Lovegood"],
            image: ["https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/1.png", "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/2.png", "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/3.png"].randomElement()!,
            birthdate: .now
        )
    }
}
