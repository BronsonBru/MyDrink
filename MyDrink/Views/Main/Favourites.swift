//import Foundation
//
//class Favourites: ObservableObject {
//    private var drinks: Set<String>
//
//    private let saveKey = "Favourites"
//
//    init() {
//        self.drinks = []
//    }
//    func contains(_ drinks: DrinksResponse) -> Bool {
//        drinks.contains(drinks.id)
//    }
//
//    func add(_ drinks: DrinksResponse) {
//        objectWillChange.send()
//        drinks.insert(drinks.id)
//        save()
//    }
//
//    func remove(_ drinks: DrinksResponse) {
//        objectWillChange.send()
//        drinks.remove(drinks.id)
//        save()
//    }
//
//    func save() {
//        
//    }
//}
