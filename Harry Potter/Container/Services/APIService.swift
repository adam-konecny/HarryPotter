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
        let reponse = await AF.request(url)
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
    
    func getBooks() async throws -> ListResponse<Book> {
        try await makeRequest(url: "https://openlibrary.org/search.json?q=the+lord+of+the+rings&limit=5&page=1&fields=title", type: ListResponse<Book>.self)
    }
}
