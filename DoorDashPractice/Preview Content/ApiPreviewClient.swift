//
//  ApiPreviewClient.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

struct ApiPreviewClient: ApiServiceConfigurable {
    func request<T>(resource: ServiceResource<T>) async throws -> T where T : Decodable {
        do {
            return try stubData(with: resource.endPoint.urlString)
        } catch {
            throw error
        }
    }
    
    private func stubData<T: Decodable>(with fileName: String) throws -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw APIError.incorrectBaseUrl
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            throw APIError.failedRequest
        }
        
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try! jsonDecoder.decode(T.self, from: data)
        } catch {
            throw APIError.failedDecoding
        }
    }
}
