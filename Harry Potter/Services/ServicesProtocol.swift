//
//  ServicesProtocol.swift
//  Harry Potter
//
//  Created by Adam Konečný on 07.11.2024.
//

protocol ServicesProtocol {
    associatedtype API: APIServiceProtocol
    
    var apiService: API { get }
}
