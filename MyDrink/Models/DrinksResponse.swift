
struct DrinksResponse: Decodable {
    let drinks: [Drink]

    private enum CodingKeys: String, CodingKey {
        case drinks = "drinks"
    }
}

struct Drink: Decodable, Identifiable {
    let id: Int
    let name: String
    let strCategory: String
    let strAlcoholic: String
    let strGlass: String
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?

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

extension Drink {
    static var dummyData: Drink {
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
