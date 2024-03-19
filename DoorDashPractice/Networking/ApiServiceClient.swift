//
//  ApiServiceClient.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

struct ApiServiceClient: ApiServiceConfigurable {
    func request<T>(resource: ServiceResource<T>) async throws -> T where T : Decodable {
        do {
            let (data, response) = try await URLSession.shared.data(from: resource.createUrl(url: resource.endPoint))
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                jsonDecoder.dateDecodingStrategy = .secondsSince1970
                return try! jsonDecoder.decode(T.self, from: data)
            } catch {
                throw APIError.failedDecoding
            }
        } catch let error {
            throw error
        }
    }
}
