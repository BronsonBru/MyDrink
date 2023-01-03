import SwiftUI
import URLImage

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Drinks")
                            .font(.callout)
                            .foregroundColor(.gray)

                        Text("Today")
                            .font(.largeTitle.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Button {

                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                    }
                }
                .padding(.horizontal)

                ForEach(dummyItems) {item in
                    CardView(item: item)
                }
            }
            .padding(.vertical)
        }
    }
    @ViewBuilder
    func CardView(item: DummyDrink) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {

                //banner image
                GeometryReader{proxy in
                    let size = proxy.size
                    Image(item.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 15))
                }
                .frame(height: 400)


                LinearGradient(colors: [
                    .gray.opacity(1),
                    .gray.opacity(0.5),
                    .gray.opacity(0.2),
                    .gray.opacity(0),
                    .clear
                ], startPoint: .bottom, endPoint: .top)
//                .cornerRadius(15)

                VStack(alignment: .leading, spacing: 8) {
                    Text(item.drinkName.uppercased())
                        .font(.callout)
                        .fontWeight(.semibold)

                    Text(item.drinkDescription)
                        .font(.largeTitle.bold())
                }
                .padding()
            }
            HStack(spacing: 12) {
                Image(item.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.drinkName.uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.gray)

                    Text(item.bannerTitle.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)

                    Text(item.drinkDescription.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Button {

                } label: {
                    Text("GET")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background{
                            Capsule()
                                .fill(.ultraThinMaterial)
                        }
                }
            }
            .padding([.horizontal, .bottom])
        }

        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(.systemGray2))
        }
        .padding(.horizontal)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()

    }
}
