//
//  APIEndpoint.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

enum APIEndpoint: String, EndpointConfigurable {
    case fetchRandomUsers
    
    var urlString: String {
        switch self {
        case .fetchRandomUsers:
            return "https://randomuser.me/api/?results=100"
        }
    }
}
