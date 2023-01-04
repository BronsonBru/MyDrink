import Foundation

struct SimpleDrinkingModal {
    var idDrink: String?
    var strDrink: String?
    var strCategory: String?
    var strAlcoholic: String?
    var strGlass: String?
    var strInstructions: String?
    var strDrinkThumb: String?
    var strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String
    var strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String
}

//search cocktail by name
//www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
//list by first letter
//www.thecocktaildb.com/api/json/v1/1/search.php?f=a
//list by catagory
//www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink
//www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail
