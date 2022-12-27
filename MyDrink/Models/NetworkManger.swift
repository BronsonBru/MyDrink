import Foundation

protocol MyDrinkListRetreviable {
    func fetchDrinkDetails(for id: String, completion: @escaping (SimpleDrinkModal?) -> Void)
}

class MyDrinkNetworkManger: MyDrinkListRetreviable {
    let baseURL = "www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    var simpleDrinkModal: SimpleDrinkModal?

    func fetchDrinkDetails(for id: String, completion: @escaping (SimpleDrinkModal?) -> Void) {
        let completeURL = baseURL + String(id)
        guard let url = URL(string: completeURL) else {
            completion(nil)
            return
        }

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let safeData = data {
                let drinks = try? JSONDecoder().decode(DrinksResponse.self, from: safeData)
                let test = true
            } else {
                completion(nil)
            }
        }
    }
}
