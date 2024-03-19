//
//  ServiceResource.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

struct ServiceResource<T: Decodable> {
    var httpMethod: HTTPMethod = .get
    var endPoint: EndpointConfigurable
    
    func createUrl(url: EndpointConfigurable) throws -> URL {
        guard let baseUrl = URL(string: url.urlString) else {
            throw APIError.incorrectBaseUrl
        }
        
        let components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)
        
        guard let url = components?.url else {
            throw APIError.incorrectBaseUrl
        }
        
        return url
    }
}
