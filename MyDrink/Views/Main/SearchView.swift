import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var viewModel = DrinkViewModel()
    @State private var searchItem = ""
    @State private var filteredDrinks: [DrinksResponse] = []

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("My Drinks")
                        .font(.callout)
                        .foregroundColor(.gray)

                    Text("Search")
                        .font(.largeTitle.bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.horizontal)
             .padding(.bottom, 5)

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
                
            }
//            .searchable(text: $viewModel.searchText) {
//                List(viewModel.searchResults) {
//                               drink in
//                                    HStack {
//
//                                        VStack(alignment: .leading) {
//                                            Text(drink.name ?? "")
//                                                .font(.headline)
//                                            Text(drink.strCategory ?? "")
//                                                .font(.subheadline)
//                                            Text(drink.strAlcoholic ?? "")
//                                                .font(.subheadline)
//                                        }
//                                    }.task {
//                                        do {
//                                            try await viewModel.fetchSearchResults()
//                                        } catch {
//                                            print(error)
//                                        }
//                                    }
//
//
//                            }
//            }

//                    .onChange(of: viewModel.searchText) { searchItem in
//                        filteredDrinks = viewModel.searchResults.filter({ drink in
//
//                        }) ?? []
//                    }

        }
        .padding(.vertical, 5)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

