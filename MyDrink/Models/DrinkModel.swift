//import Foundation
//
//class Drinks {
//
//    struct Returned: Codable {
//        var drinks: [Drink]
//    }
//
//    struct Drink: Codable {
//        var id: String
//        var name: String
//        var drinkAlt: String?
//        var video: String?
//        var alcoholic: String?
//        var glass: String?
//        var instructions: String?
//        var thumb: String?
//        var ingredients: [Ingredient]
//    }
//
//    let urlString = "www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
//    var drinkArray: [Drink] = []
//
//    func getData(completed: @escaping () -> ()) {
//        print("We are accessing the url \(urlString)")
//        // create a url
//        guard let url = URL(string: urlString) else {
//            print("ERROR: Could not create a URL from \(urlString)")
//            completed()
//            return
//        }
//        //create session
//        let session = URLSession.shared
//
//        // get data with .dataTask method
//        let task = session.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("ERROR: \(error.localizedDescription)")
//            }
//
//            //deal with data
//            do {
//                let returned = try JSONDecoder().decode(Returned.self, from: data!)
//                self.drinkArray = self.drinkArray + returned.drinks
//            } catch {
//                print("JSON ERROR: \(error.localizedDescription)")
//            }
//            completed()
//        }
//
//        task.resume()
//    }
//}
