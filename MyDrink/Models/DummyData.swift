import SwiftUI

struct DummyDrink: Identifiable {
    var id = UUID().uuidString
    var drinkName: String
    var drinkDescription: String
    var bannerTitle: String
    var artwork: String
}

var dummyItems: [DummyDrink] = [
    DummyDrink(drinkName: "lost", drinkDescription: "drowning in spirits", bannerTitle: "Striaght to the grave", artwork: "nata"),
    DummyDrink(drinkName: "straight", drinkDescription: "cyber love at its best", bannerTitle: "Straight to the grave", artwork: "cyberlove")
]
