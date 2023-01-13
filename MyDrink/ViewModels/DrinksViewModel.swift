import Foundation
import Combine

class DrinkViewModel: ObservableObject, Identifiable {
    @Published var searchResults = DrinksResponse()
    @Published var searchText = String()
    let network = MyDrinkNetworkManger()
    @Published var randomDrinkResult = DrinksResponse()

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
}


//import Foundation
//import Combine
//
//class DrinkViewModel: ObservableObject, Identifiable {
//    @Published var searchResults: [DrinksResponse] = []
//    let network = MyDrinkNetworkManger()
//    var drinkResponse : DrinksResponse?
//    func fetchDrinks(result: String) {
//        network.fetchDrinkDetails(search: result) { drinkItem in
//            self.drinkResponse = drinkItem
//        }
//    }
//}
