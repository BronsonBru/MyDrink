import Foundation

protocol MyDrinkListRetreviable {
    func fetchDrinkDetails(search: String, for id: String, completion: @escaping (SimpleDrinkModal?) -> Void)
}

class MyDrinkNetworkManger: MyDrinkListRetreviable {
    var simpleDrinkModal: SimpleDrinkModal?

    func fetchDrinkDetails(search: String, for id: String, completion: @escaping (SimpleDrinkModal?) -> Void) {
        let baseURL = "www.thecocktaildb.com/api/json/v1/1/search.php?s=\(search)"
//        let completeURL = baseURL + String(id)

        let serviceGroup = DispatchGroup()
//        serviceGroup.enter()
        guard let url = URL(string: baseURL) else {
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

//    private func convertServiceDrinks(drinkData: DrinksResponse?) -> SimpleDrinkModal? {
//        guard let safeDrinkData = drinkData else { return nil }
//
//        return SimpleDrinkModal(idDrink: ,
//                                strDrink: <#T##String#>,
//                                strCategory: <#T##String#>,
//                                strAlcoholic: <#T##String#>,
//                                strGlass: <#T##String#>,
//                                strInstructions: <#T##String#>,
//                                strDrinkThumb: <#T##String#>,
//                                strIngredient1: <#T##String#>,
//                                strIngredient2: <#T##String#>,
//                                strIngredient3: <#T##String#>,
//                                strIngredient4: <#T##String#>,
//                                strIngredient5: <#T##String#>,
//                                strIngredient6: <#T##String#>,
//                                strIngredient7: <#T##String#>,
//                                strIngredient8: <#T##String#>,
//                                strIngredient9: <#T##String#>,
//                                strIngredient10: <#T##String#>,
//                                strIngredient11: <#T##String#>,
//                                strIngredient12: <#T##String#>,
//                                strIngredient13: <#T##String#>,
//                                strIngredient14: <#T##String#>,
//                                strIngredient15: <#T##String#>,
//                                strMeasure1: <#T##String#>,
//                                strMeasure2: <#T##String#>,
//                                strMeasure3: <#T##String#>,
//                                strMeasure4: <#T##String#>,
//                                strMeasure5: <#T##String#>,
//                                strMeasure6: <#T##String#>,
//                                strMeasure7: <#T##String#>,
//                                strMeasure8: <#T##String#>,
//                                strMeasure9: <#T##String#>,
//                                strMeasure10: <#T##String#>,
//                                strMeasure11: <#T##String#>,
//                                strMeasure12: <#T##String#>,
//                                strMeasure13: <#T##String#>,
//                                strMeasure14: <#T##String#>,
//                                strMeasure15: <#T##String#>)
//    }
}
