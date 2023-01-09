//import SwiftUI
//
//struct CardView: View {
//    @ObservedObject private var viewModel = DrinkViewModel()
//
//    @State var currentItem: DrinksResponse?
//   
//    //match geometery
//    @Namespace var animation
//    @State var animationView: Bool = false
//
//
//    var item : DrinksResponse
//
//    var body: some View {
//            VStack(alignment: .leading, spacing: 15) {
//                ZStack(alignment: .topLeading) {
//
//                    //banner image
//                    GeometryReader{proxy in
//                        let size = proxy.size
//                        Image(item.strDrinkThumb)
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: size.width, height: size.height)
//                            .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 15))
//                    }
//                    .frame(height: 400)
//
//
//                    LinearGradient(colors: [
//                        .black.opacity(1),
//                        .black.opacity(0.3),
//                        .black.opacity(0.25),
//                        .black.opacity(0.15),
//                        .gray.opacity(0.3),
//                        .black.opacity(1),
//                    ], startPoint: .bottom, endPoint: .top)
//                    .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 15))
//
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text(item.name.uppercased())
//                            .font(.callout)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//
//                        Text(item.name)
//                            .font(.largeTitle.bold())
//                            .foregroundColor(.white)
//                            .multilineTextAlignment(.leading)
//                    }
//                    .padding()
//                    .offset(y: currentItem?.id == item.id && animationView ? safeArea().top : 0)
//                }
//                HStack(spacing: 12) {
//                    Image(item.strDrinkThumb)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 60, height: 60)
//                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text(item.name.uppercased())
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//
//                        Text(item.name.uppercased())
//                            .font(.caption)
//                            .foregroundColor(.white)
//
//                        Text(item.strCategory.uppercased())
//                            .font(.caption)
//                            .foregroundColor(.white)
//                    }
//                    .foregroundColor(.primary)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                    Button {
//
//                    } label: {
//                        Image(systemName: "heart")
//                            .fontWeight(.bold)
//                            .foregroundColor(.red)
//                            .padding(.vertical, 8)
//                            .padding(.horizontal, 20)
//                            .background{
//                                Capsule()
//                                    .fill(.ultraThinMaterial)
//                            }
//                    }
//                }
//                .padding([.horizontal, .bottom])
//            }
//
//            .background{
//                RoundedRectangle(cornerRadius: 15, style: .continuous)
//                    .fill(Color(.black))
//            }
//            .matchedGeometryEffect(id: item.id, in: animation)
//        }
//    }
//
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(item: DrinksResponse.dummyData)
//    }
//}
