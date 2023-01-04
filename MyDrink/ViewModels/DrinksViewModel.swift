import Foundation
import Combine

class DrinkViewModel: ObservableObject, Identifiable {
    @Published var searchResults: [Drink] = []
    let network = MyDrinkNetworkManger()
    var drinkResponse : DrinksResponse?
    func fetchDrinks(result: String) {
        network.fetchDrinkDetails(search: result) { drinkItem in
            self.drinkResponse = drinkItem
        }
    }
}
