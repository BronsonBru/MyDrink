//import Foundation
//
//protocol DrinkingListRetreivable {
//    func fetchDrinkingList(completion: @escaping ([Drinking]) -> Void)
//}
//
//class DrinkingNewtworkManager: DrinkingListRetreivable {
//    let endpoint = "www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
//
//    func fetchDrinkingList(completion: ([Drinking]) -> Void) {
//        guard let url = URL(string: endpoint) else {
//            completion([])
//            return
//        }
//
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            <#code#>
//        }
//    }
//}


//search cocktail by name
//www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
//list by first letter
//www.thecocktaildb.com/api/json/v1/1/search.php?f=a
//list by catagory
//www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink
//www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail
