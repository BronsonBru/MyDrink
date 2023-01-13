import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView(drinks: DrinksResponse.dummyData)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SearchViewTest()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            FavoritesView()
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
