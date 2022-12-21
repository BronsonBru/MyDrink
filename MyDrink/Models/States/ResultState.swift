import Foundation

enum ResultState {
    case loading
    case success(content: [Drinks])
    case failed(error: Error)
}
