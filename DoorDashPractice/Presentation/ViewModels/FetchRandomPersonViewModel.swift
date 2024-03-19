//
//  FetchRandomPersonViewModel.swift
//  DoorDashPractice
//
//  Created by Simon Mcneil on 2024-03-18.
//

import Foundation

class FetchRandomPersonViewModel: ObservableObject {
    @Published private(set) var results: [UserDetails] = []
    
    private let apiServiceClient: ApiServiceConfigurable
    private let serviceResource: ServiceResource<RandomUserModel>
    
    init(apiServiceClient: ApiServiceConfigurable = ApiServiceClient(), serviceResource: ServiceResource<RandomUserModel>) {
        self.apiServiceClient = apiServiceClient
        self.serviceResource = serviceResource
    }
    
    @MainActor
    func fetchRandomPeople() async {
        do {
            results = try await apiServiceClient.request(resource: serviceResource).results
        } catch {
            print(error)
            // Error state to present error pop up in view
        }
    }
}
