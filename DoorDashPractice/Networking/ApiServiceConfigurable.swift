//
//  ApiServiceConfigurable.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

protocol ApiServiceConfigurable {
    func request<T: Decodable>(resource: ServiceResource<T>) async throws -> T
}
