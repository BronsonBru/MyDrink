import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = DrinkViewModel()
    @State private var searchItem = ""
    @State private var filteredDrinks: [Drink] = []

    var body: some View {
        NavigationView {
            VStack {
                Text("Find a Drink")
                    .font(.title.weight(.bold))
                Text("Start searching for a Drink")
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.gray)
            .navigationTitle("Search")
        }
        .searchable(text: $searchItem) {
            ForEach(filteredDrinks) { drink in
                HStack {
                   
                    VStack(alignment: .leading) {
                        Text(drink.name ?? "")
                            .font(.headline)
                        Text(drink.strCategory ?? "")
                            .font(.subheadline)
                        Text(drink.strAlcoholic ?? "")
                            .font(.subheadline)
                    }
                }

            }
        }
        .onChange(of: searchItem) { searchItem in
            filteredDrinks = viewModel.drinkResponse?.drinks.filter({ drink in
                drink.name.contains(searchItem)
            }) ?? []
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

