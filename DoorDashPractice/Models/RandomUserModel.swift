//
//  RandomUserModel.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

struct RandomUserModel: Decodable {
    let results: [UserDetails]
}

struct UserDetails: Decodable {
    let gender: String
    let name: NameDetails
    let email: String
    let phone: String
    let cell: String
}

struct NameDetails: Decodable {
    let first: String
    let last: String
}
