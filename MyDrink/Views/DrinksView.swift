import SwiftUI
import URLImage

struct DrinksView: View {

    let drinks: Drink

    var body: some View {
        HStack {
            if let imgURL = drinks.strDrinkThumb,
               let url = URL(string: imgURL) {

                URLImage(url,
                         content: {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(drinks.name ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(drinks.strCategory ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView(drinks: Drink.dummyData)
    }
}
