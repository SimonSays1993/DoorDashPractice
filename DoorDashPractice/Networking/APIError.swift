//
//  APIError.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

enum APIError: Error {
    case failedRequest
    case failedDecoding
    case incorrectBaseUrl
    case invalidResponse
    case unknown(message: String)
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failedRequest:
            return "Failed Request"
        case .failedDecoding:
            return "Failed Decoding"
        case .incorrectBaseUrl:
            return "Incorrect Base Url"
        case .invalidResponse:
            return" Invalid Response"
        case .unknown(let message):
            return message
        }
    }
}
