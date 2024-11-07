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
    let birthdate: String
}
