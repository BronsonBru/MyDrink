import Foundation

// MARK: - Welcome
struct DrinksResponse: Codable {
    let drinks: [Drinks]
}

// MARK: - Drink
struct Drinks: Codable {
    let idDrink: String?
    let strDrink: String?
    let strCategory: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?
}

extension Drinks {
    static var dummyData: Drinks {
        .init(idDrink: "11243",
              strDrink: "Chocolate Black Russian",
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
