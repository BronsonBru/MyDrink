import SwiftUI

struct FavoritesView: View {
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
                DrinksView(drinks: DrinksResponse.dummyData)
            }
            .navigationTitle("Favourites")
        }.padding(.vertical, 5)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
