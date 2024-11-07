//
//  Errors.swift
//  Harry Potter
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

enum AppError: Error {
    case unknownError
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return "Unknown error!"
        }
    }
}
