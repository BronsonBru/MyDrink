import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum DrinkAPI {
    case getDrinks
}

extension DrinkAPI: APIBuilder {
    var baseURL: URL {
        switch self {
        case .getDrinks:
            return URL(string: "http://www.thecocktaildb.com/api/json/v1/1/random.php")!
        }
    }

    var path: String {
        return "/drinks"
    }
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
}
