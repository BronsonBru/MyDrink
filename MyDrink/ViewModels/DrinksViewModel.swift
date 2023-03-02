import Foundation
import Combine

class DrinkViewModel: ObservableObject, Identifiable {
    @Published var searchResults = DrinksResponse()
    @Published var searchText = String()
    let network = MyDrinkNetworkManger()
    @Published var randomDrinkResult = DrinksResponse()
    @Published var favouriteDrinks = [DrinksResponse]()

    func fetchSearchResults() {
        network.fetchDrinksSearch(search: searchText) { result in
            self.searchResults = result ?? DrinksResponse()
        }
    }

    func fetchRandomResults() {
        network.fetchDrinkDetails() { details in
            self.randomDrinkResult = details ?? DrinksResponse()
        }
    }

    func isDrinkFavourite(drink: DrinksResponse) -> Bool {
        return favouriteDrinks.contains(drink)
    }

    func addToFavourites(drink: DrinksResponse) {
        if !isDrinkFavourite(drink: drink) {
            self.favouriteDrinks.append(drink)
        }
    }
}
