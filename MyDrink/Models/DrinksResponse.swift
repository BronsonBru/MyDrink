import Foundation

//struct DrinksResponse: Decodable {
//    let drinks: [Drink]
//
//    private enum CodingKeys: String, CodingKey {
//        case drinks = "drinks"
//    }
//}

class DrinksResponse: Decodable, Identifiable {
    let id: Int
    let name: String
    let strCategory: String
    let strAlcoholic: String
    let strGlass: String
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?

    init(id: Int = Int(),
         name: String = String(),
         strCategory: String = String(),
         strAlcoholic: String = String(),
         strGlass: String = String(),
         strInstructions: String = String(),
         strDrinkThumb: String = String(),
         strIngredient1: String = String(),
         strIngredient2: String = String(),
         strIngredient3: String? = String(),
         strIngredient4: String? = String(),
         strIngredient5: String? = String(),
         strIngredient6: String? = String(),
         strIngredient7: String? = String(),
         strIngredient8: String? = String(),
         strIngredient9: String? = String(),
         strIngredient10: String? = String(),
         strIngredient11: String? = String(),
         strIngredient12: String? = String(),
         strIngredient13: String? = String(),
         strIngredient14: String? = String(),
         strIngredient15: String? = String(),
         strMeasure1: String? = String(),
         strMeasure2: String? = String(),
         strMeasure3: String? = String(),
         strMeasure4: String? = String(),
         strMeasure5: String? = String(),
         strMeasure6: String? = String(),
         strMeasure7: String? = String(),
         strMeasure8: String? = String(),
         strMeasure9: String? = String(),
         strMeasure10: String? = String(),
         strMeasure11: String? = String(),
         strMeasure12: String? = String(),
         strMeasure13: String? = String(),
         strMeasure14: String? = String(),
         strMeasure15: String? = String()) {
        self.id = id
        self.name = name
        self.strCategory = strCategory
        self.strAlcoholic = strAlcoholic
        self.strGlass = strGlass
        self.strInstructions = strInstructions
        self.strDrinkThumb = strDrinkThumb
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
    }


    private enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case strCategory = "strCategory"
        case strAlcoholic = "strAlcoholic"
        case strGlass = "strGlass"
        case strInstructions = "strInstructions"
        case strDrinkThumb = "strDrinkThumb"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"



    }
}





//import Foundation
//
//// MARK: - Welcome
//struct DrinksResponse: Codable {
//    let drinks: [Drinks]
//}
//
//// MARK: - Drink
//struct Drinks: Codable, Identifiable {
//    var id: Int?
//    var strDrink: String?
//    var strCategory: String?
//    var strAlcoholic: String?
//    var strGlass: String?
//    var strInstructions: String?
//    var strDrinkThumb: String?
//    var strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
//    var strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?
//
//
//
//    private enum CodingKeys: String, CodingKey {
//          case id = "idDrink"
////          case name = "strDrink"
////          case imageURL = "strDrinkThumb"
////          case ingredients
////          case instructions = "strInstructions"
//      }
//}

extension DrinksResponse {
    static var dummyData: DrinksResponse {
    .init( id: 11243,
           name: "Chocolate Black Russian",
              strCategory: "Ordinary Drink",
              strAlcoholic: "Alcoholic",
              strGlass: "Champagne flute",
              strInstructions: "Combine all ingredients in an electric blender and blend at a low speed for a short length of time. Pour into a chilled champagne flute and serve.",
              strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/yyvywx1472720879.jpg",
              strIngredient1: "Kahlua",
              strIngredient2: "Vodka",
              strIngredient3: "Chocolate ice-cream",
              strIngredient4: "",
              strIngredient5: "",
              strIngredient6: "",
              strIngredient7: "",
              strIngredient8: "",
              strIngredient9: "",
              strIngredient10: "",
              strIngredient11: "",
              strIngredient12: "",
              strIngredient13: "",
              strIngredient14: "",
              strIngredient15: "",
              strMeasure1: "1 oz ",
              strMeasure2: "1/2 oz ",
              strMeasure3: "5 oz ",
              strMeasure4: "",
              strMeasure5: "",
              strMeasure6: "",
              strMeasure7: "",
              strMeasure8: "",
              strMeasure9: "",
              strMeasure10: "",
              strMeasure11: "",
              strMeasure12: "",
              strMeasure13: "",
              strMeasure14: "",
              strMeasure15: "")
    }
}
