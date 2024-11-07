//
//  APIService.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import Alamofire
import Foundation

// https://github.com/fedeperin/potterapi?ref=public_apis
class APIService {
    private func makeRequest<T: Decodable>(url: String, type: T.Type) async throws -> T {
        let reponse = await AF.request("https://potterapi-fedeperin.vercel.app" + url)
            .validate()
            .serializingDecodable(T.self)
            .response
        
        switch reponse.result {
        case .success(let value):
            return value
        case .failure:
            throw reponse.error ?? AppError.unknownError
        }
    }
    
    func getCharacters() async throws -> [Person] {
        try await makeRequest(url: "/en/characters", type: [Person].self)
    }
    
    func getSpells() async throws -> [Spell] {
        try await makeRequest(url: "/en/spells", type: [Spell].self)
    }
}
