import Foundation

@MainActor
class SearchNetworkModel: ObservableObject {
    @Published var drinkSearch : [DrinksResponse] = []

    func fetchDrinksTest() async throws {
        var request = URLRequest(url: URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a")!)
        request.addValue("1", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let drinkSearchResponse = try JSONDecoder().decode(DrinksMainResponse.self, from: data)
        drinkSearch = drinkSearchResponse.drinks
    }
}
