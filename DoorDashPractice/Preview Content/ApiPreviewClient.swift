//
//  ApiPreviewClient.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

class ApiPreviewClient: ApiServiceConfigurable {
    func request<T>(resounrce: ServiceResource<T>) async throws -> T where T : Decodable {
        do {
            return try stubData(with: resounrce.endPoint.urlString)
        } catch {
            throw error
        }
    }
    
    private func stubData<T: Decodable>(with fileName: String) throws -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Coundn't find \(fileName) in main bundle")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
        }
        
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            throw APIError.failedDecoding
        }
    }
}
