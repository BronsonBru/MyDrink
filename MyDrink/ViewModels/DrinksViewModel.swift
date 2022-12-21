import Foundation
import Combine

protocol DrinksViewModel {
    func getDrinks()
}

class DrinksViewModelImpl: ObservableObject, DrinksViewModel {
    private let service: DrinksService

    private(set) var drinks = [Drinks]()
    private var cancellables = Set<AnyCancellable>()

    @Published private(set) var state: ResultState = .loading

    init(service: DrinksService) {
        self.service = service
    }

    func getDrinks() {
        self.state = .loading

        let cancellable = service
            .request(from: .getDrinks)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.drinks)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.drinks = response.drinks
        }

        self.cancellables.insert(cancellable)
    }
}
