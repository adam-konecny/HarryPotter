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
    
    enum CodingKeys: String, CodingKey {
        case fullName
        case nickname
        case hogwartsHouse
        case interpretedBy
        case children
        case image
        case birthdate
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.fullName = try container.decode(String.self, forKey: .fullName)
        self.nickname = try container.decode(String.self, forKey: .nickname)
        self.hogwartsHouse = try container.decode(String.self, forKey: .hogwartsHouse)
        self.interpretedBy = try container.decode(String.self, forKey: .interpretedBy)
        self.children = try container.decode([String].self, forKey: .children)
        self.image = try container.decode(String.self, forKey: .image)
        
        let birthdate = try container.decode(String.self, forKey: .birthdate)
        
        guard let date = birthdate.date(with: .server) else {
            throw AppError.wrongDateFormat
        }
        
        self.birthdate = date
    }
}
