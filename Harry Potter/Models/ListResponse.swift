//
//  ListResponse.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

struct ListResponse<T: Decodable>: Decodable {
    let docs: [T]
}
