import Foundation
import XCTest
@testable import DoorDashPractice

final class ApiClientTests: XCTestCase {
    func testDecodingContent() async throws {
        let client = ApiPreviewClient()
        let serviceResource = ServiceResource<RandomUserModel>(endPoint: MockAPIEndpoint.fetchRandomUsers)
        
        let request = try await client.request(resource: serviceResource)
        XCTAssertFalse(request.results.isEmpty)
    }
}
