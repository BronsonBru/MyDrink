import Foundation

protocol MyDrinkListRetreviable {
    func fetchDrinkDetails(completion: @escaping (DrinksResponse?) -> Void)
}

class MyDrinkNetworkManger: MyDrinkListRetreviable {
    static let shared = MyDrinkNetworkManger()

    var cache: [Int: DrinksResponse?] = [:]
    var drinkInfo: DrinksResponse?
    var drinkResponse: DrinksResponse?


    func fetchDrinksSearch(search: String, completion: @escaping (DrinksResponse?) -> Void) {

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

    func fetchDrinkDetails(completion: @escaping (DrinksResponse?) -> Void) {
        let baseURL = "www.thecocktaildb.com/api/json/v1/1/random.php"



        let completeURL = baseURL
        guard let safeURL = URL(string: completeURL) else {
            completion(nil)
            return
        }

        let request = URLRequest(url: safeURL)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let safeData = data {
                let drinks = try? JSONDecoder().decode(DrinksResponse.self, from: safeData)
                self?.drinkInfo = drinks
                completion(self?.drinkInfo)

            }

        }
        task.resume()

        }
    
//    func converServiceDrinks(drinkdata: DrinksResponse?) -> SimpleDrinkModel? {
//        guard let safeDrinkData = drinkdata else { return nil }
//        return SimpleDrinkModel(id: safeDrinkData.id,
//                                name: safeDrinkData.name,
//                                strCategory: safeDrinkData.strCategory,
//                                strAlcoholic: safeDrinkData.strAlcoholic,
//                                strGlass: safeDrinkData.strGlass,
//                                strInstructions: safeDrinkData.strInstructions,
//                                strDrinkThumb: safeDrinkData.strDrinkThumb,
//                                strIngredient1: safeDrinkData.strIngredient1,
//                                strIngredient2: safeDrinkData.strIngredient2,
//                                strIngredient3: safeDrinkData.strIngredient3,
//                                strIngredient4: safeDrinkData.strIngredient4,
//                                strIngredient5: safeDrinkData.strIngredient5,
//                                strIngredient6: safeDrinkData.strIngredient6,
//                                strIngredient7: safeDrinkData.strIngredient7,
//                                strIngredient8: safeDrinkData.strIngredient8,
//                                strIngredient9: safeDrinkData.strIngredient9,
//                                strIngredient10: safeDrinkData.strIngredient10,
//                                strIngredient11: safeDrinkData.strIngredient11,
//                                strIngredient12: safeDrinkData.strIngredient12,
//                                strIngredient13: safeDrinkData.strIngredient13,
//                                strIngredient14: safeDrinkData.strIngredient14,
//                                strIngredient15: safeDrinkData.strIngredient15,
//                                strMeasure1: safeDrinkData.strMeasure1,
//                                strMeasure2: safeDrinkData.strMeasure2,
//                                strMeasure3: safeDrinkData.strMeasure3,
//                                strMeasure4: safeDrinkData.strMeasure4,
//                                strMeasure5: safeDrinkData.strMeasure5,
//                                strMeasure6: safeDrinkData.strMeasure6,
//                                strMeasure7: safeDrinkData.strMeasure7,
//                                strMeasure8: safeDrinkData.strMeasure8,
//                                strMeasure9: safeDrinkData.strMeasure9,
//                                strMeasure10: safeDrinkData.strMeasure10,
//                                strMeasure11: safeDrinkData.strMeasure11,
//                                strMeasure12: safeDrinkData.strMeasure12,
//                                strMeasure13: safeDrinkData.strMeasure13,
//                                strMeasure14: safeDrinkData.strMeasure14,
//                                strMeasure15: safeDrinkData.strMeasure15)
//    }
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


//import Foundation
//
//protocol MyDrinkListRetreviable {
//    func fetchDrinkDetails(search: String, completion: @escaping (DrinksResponse?) -> Void)
//}
//
//class MyDrinkNetworkManger: MyDrinkListRetreviable {
//    var drinkResponse: DrinksResponse?
//
//    func fetchDrinkDetails(search: String, completion: @escaping (DrinksResponse?) -> Void) {
//        let baseURL = "www.thecocktaildb.com/api/json/v1/1/search.php?s=\(search)"
//        guard let safeURL = URL(string: baseURL) else {
//            fatalError("Invalid URL")
//        }
//
//        let serviceGroup = DispatchGroup()
//        serviceGroup.enter()
//
//        let request = URLRequest(url: safeURL)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                return
//            }
//            do {
//                let decodedData = try JSONDecoder().decode(DrinksResponse.self, from: data)
//                self.drinkResponse = decodedData
//                serviceGroup.leave()
//            }
//            catch let error {
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//        serviceGroup.notify(queue: DispatchQueue.global()) {[ weak self ] in
//            DispatchQueue.main.async {
//                guard let safeDrinkResponse = self?.drinkResponse else {
//                    return
//
//                }
//                completion(safeDrinkResponse)
//            }
//        }
//    }
//}
