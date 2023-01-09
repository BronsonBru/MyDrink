import SwiftUI
import URLImage

struct DrinksView: View {

    let drinks: DrinksResponse

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
                .frame(width: 80, height: 80)
                .cornerRadius(15)
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
            Spacer()
            Button {

            } label: {
                Image(systemName: "heart")
                    .padding()
                    .foregroundColor(Color.red)
            }

        }
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 80, height: 80)
    }
}

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView(drinks: DrinksResponse.dummyData)
    }
}
