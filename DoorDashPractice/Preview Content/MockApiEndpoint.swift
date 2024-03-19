import Foundation

enum MockAPIEndpoint: String, EndpointConfigurable {
    case fetchRandomUsers
    
    var urlString: String {
        switch self {
        case .fetchRandomUsers:
            return "randomPeople"
        }
    }
}
