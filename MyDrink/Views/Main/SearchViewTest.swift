import SwiftUI
import URLImage

struct SearchViewTest: View {

    @StateObject private var networkModel = SearchNetworkModel()
    @State private var filteredDrinks: [DrinksResponse] = []
    @State private var search = ""
    @ObservedObject var favourite: DrinkViewModel

    private func performSearch(keyWord: String) {
        filteredDrinks = networkModel.drinkSearch.filter { drink in
            drink.name.contains(keyWord)
        }
    }

    private var drink: [DrinksResponse] {
        filteredDrinks.isEmpty ? networkModel.drinkSearch: filteredDrinks
    }

    var body: some View {
        NavigationStack {
            VStack {
                List(drink) { drink in
                    HStack {
                        if let imgURL = drink.strDrinkThumb,
                           let url = URL(string: imgURL) {

                            URLImage(url,
                                     content: {image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            })
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        } else {
                            PlaceHolderImageView()
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(drink.name)
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            Text(drink.strCategory)
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                        Spacer()
                        Button {
                            favourite.addToFavourites(drink: drink)
                        } label: {
                            Image(systemName: favourite.isDrinkFavourite(drink: drink) ? "heart.fill" : "heart")
                                .padding()
                                .foregroundColor(Color.red)
                        }
                    }
                }
                .searchable(text: $search)
                .onChange(of: search, perform: performSearch)
                .task {
                    do {
                        try await networkModel.fetchDrinksTest()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

//struct SearchViewTest_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchViewTest()
//    }
//}
