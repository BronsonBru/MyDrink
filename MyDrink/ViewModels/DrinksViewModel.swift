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

//extension ContentView {
//    final class ViewModel: ObservableObject {
//        @Published var items = [Item]()
//        @Published var showingFavs = false
//        @Published var 
//    }
//}
