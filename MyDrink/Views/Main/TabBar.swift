import SwiftUI

struct TabBar: View {
    @StateObject var viewModel = DrinkViewModel()
    var body: some View {
        TabView {
            HomeView(drinks: DrinksResponse.dummyData, viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SearchViewTest(favourite: viewModel)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            FavoritesView(favourite: viewModel)
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
