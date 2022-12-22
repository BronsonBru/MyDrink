import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
}

enum DrinkAPI {
    case getDrinks
}

extension DrinkAPI: APIBuilder {
    var baseURL: URL {
        switch self {
        case .getDrinks:
            return URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a")!
        }
    }


    var urlRequest: URLRequest {
        return URLRequest(url: baseURL)
    }
}
