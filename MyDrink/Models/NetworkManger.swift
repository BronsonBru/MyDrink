import Foundation

protocol MyDrinkListRetreviable {
    func fetchDrinkDetails(search: String, completion: @escaping (DrinksResponse?) -> Void)
}

class MyDrinkNetworkManger: MyDrinkListRetreviable {
    var drinkResponse: DrinksResponse?

    func fetchDrinkDetails(search: String, completion: @escaping (DrinksResponse?) -> Void) {
        let baseURL = "www.thecocktaildb.com/api/json/v1/1/search.php?s=\(search)"
        guard let safeURL = URL(string: baseURL) else {
            fatalError("Invalid URL")
        }

        let serviceGroup = DispatchGroup()
        serviceGroup.enter()

        let request = URLRequest(url: safeURL)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(DrinksResponse.self, from: data)
                self.drinkResponse = decodedData
                serviceGroup.leave()
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
        serviceGroup.notify(queue: DispatchQueue.global()) {[ weak self ] in
            DispatchQueue.main.async {
                guard let safeDrinkResponse = self?.drinkResponse else {
                    return

                }
                completion(safeDrinkResponse)
            }
        }
    }
}
//random drink return
//www.thecocktaildb.com/api/json/v1/1/random.php
//search cocktail by name
//www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
//list by first letter
//www.thecocktaildb.com/api/json/v1/1/search.php?f=a
//list by catagory
//www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink
//www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail
