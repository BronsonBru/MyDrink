//
//  FixTestModel.swift
//  MyDrink
//
//  Created by Bronson van den Broeck on 2023/01/09.
//

import Foundation
// MARK: - SearchedDrinkDetails
struct RandomDrinkDetails: Codable {
    let drinks: [Drink]
}
// MARK: - Drink
struct Drink: Codable {
    let idDrink: String
    let strDrink: String
    let strCategory: String
    let strAlcoholic, strGlass, strInstructions: String
    let strDrinkThumb: String
    let strIngredient1, strIngredient2, strIngredient3: String
    let strIngredient4, strIngredient5, strIngredient6, strIngredient7: String?
    let strIngredient8, strIngredient9, strIngredient10, strIngredient11: String??
    let strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3: String
    let strMeasure4, strMeasure5, strMeasure6, strMeasure7: String?
    let strMeasure8, strMeasure9, strMeasure10, strMeasure11: String?
    let strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?

    enum CodingKeys: String, CodingKey {
        case idDrink, strDrink, strCategory, strAlcoholic, strGlass, strInstructions
        case strDrinkThumb, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
    }
}






