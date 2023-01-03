import SwiftUI

struct DummyDrink: Identifiable {
    var id = UUID().uuidString
    var drinkName: String
    var drinkDescription: String
    var bannerTitle: String
    var artwork: String
    var strInstructions: String
    var strIngredient1: String
    var strIngredient2: String
    var strIngredient3: String
    var strMeasure1: String
    var strMeasure2: String
    var strMeasure3: String
}

var dummyItems: [DummyDrink] = [
    DummyDrink(drinkName: "lost", drinkDescription: "drowning in spirits", bannerTitle: "Striaght to the grave", artwork: "nata",strInstructions: "Combine all ingredients in an electric blender and blend at a low speed for a short length of time. Pour into a chilled champagne flute and serve.", strIngredient1: "Kahlua", strIngredient2: "Vodka", strIngredient3: "Chocolate ice-cream", strMeasure1: "1 oz ", strMeasure2: "1/2 oz ", strMeasure3: "5 oz "),
    DummyDrink(drinkName: "straight", drinkDescription: "cyber love at its best", bannerTitle: "Straight to the grave", artwork: "cyberlove", strInstructions: "Combine all ingredients in an electric blender and blend at a low speed for a short length of time. Pour into a chilled champagne flute and serve.", strIngredient1: "Kahlua", strIngredient2: "Vodka", strIngredient3: "Chocolate ice-cream", strMeasure1: "1 oz ", strMeasure2: "1/2 oz ", strMeasure3: "5 oz ")
]
