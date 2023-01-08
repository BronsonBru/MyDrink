import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var viewModel = DrinkViewModel()
    @State private var searchItem = ""
    @State private var filteredDrinks: [DrinksResponse] = []

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
        .searchable(text: $viewModel.searchText) {
//            List {
//                ForEach(viewModel.searchResults, id:\.self) { drink in
//                    HStack {
//
//                        VStack(alignment: .leading) {
//                            Text(drink.name ?? "")
//                                .font(.headline)
//                            Text(drink.strCategory ?? "")
//                                .font(.subheadline)
//                            Text(drink.strAlcoholic ?? "")
//                                .font(.subheadline)
//                        }
//                    }
//
//                }
//            }
        }
//        .onChange(of: viewModel.searchText) { searchItem in
//            filteredDrinks = viewModel.searchResults.filter({ drink in
//
//            }) ?? []
//        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

