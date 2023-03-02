import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favourite: DrinkViewModel
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("My Drinks")
                        .font(.callout)
                        .foregroundColor(.gray)

                    Text("Favourites")
                        .font(.largeTitle.bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }.padding(.horizontal)
             .padding(.bottom, 5)
            List {
                ForEach(favourite.favouriteDrinks) { drink in
                    DrinksView(drinks: drink, viewModel: favourite)
                }
            }.onAppear {

            }
            .navigationTitle("Favourites")
        }.padding(.vertical, 5)
    }
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
