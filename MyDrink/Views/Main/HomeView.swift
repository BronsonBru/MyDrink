import SwiftUI
import URLImage

struct HomeView: View {
    //dummy data
    let drinks: DrinksResponse
    // animation properties
//    @EnvironmentObject var favourites: Favourites

    @State var currentItem: DrinksResponse?
    @State var showDetailPage: Bool = false
    //match geometery
    @Namespace var animation
    @State var animationView: Bool = false
    @State var animationContent: Bool = false
    @State var scrollOffset: CGFloat = 0
    @ObservedObject var viewModel: DrinkViewModel



    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("My Drinks")
                            .font(.callout)
                            .foregroundColor(.gray)

                        Text("Recommended")
                            .font(.largeTitle.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                 
                }
                .padding(.horizontal)
                .padding(.bottom, 5)
                .opacity(showDetailPage ? 0 : 1)

                VStack {

                        Button {
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                showDetailPage = true
                                currentItem = viewModel.randomDrinkResult

                            }
                        }
                label: {
                            CardView(item: viewModel.randomDrinkResult)
                            // for matched geometry effect
                                .scaleEffect(currentItem?.id == viewModel.randomDrinkResult.id && showDetailPage ? 1 : 0.93)
                    
                        }
                        .buttonStyle(ScaledButtonStyle())
                        .opacity(showDetailPage ? (currentItem?.id == viewModel.randomDrinkResult.id ? 1 : 0) : 1)

                    }

                HStack{
                    Button(action: {
                        viewModel.fetchRandomResults()
                                    }) {
                        Text("Get a new drink!")
                            .font(.headline)
                    }
                    .padding(15)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(20)
                    .padding(30)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                    .opacity(showDetailPage ? 0 : 1)
                }

                //end
            }
            .padding(.vertical, 5)

        }
        .onAppear {
            viewModel.fetchRandomResults()
        }
        .overlay {
            if let currentItem = currentItem, showDetailPage {
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        .background(alignment: .top) {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(.white))
                .frame(height: animationView ? nil : 350, alignment: .top)
                .opacity(animationView ? 1 : 0)
                .ignoresSafeArea()

        }
    }
    //CardView
    @ViewBuilder
    func CardView(item: DrinksResponse) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {

                //banner image
                GeometryReader { proxy in
                    let size = proxy.size
                    if let imgURL = item.strDrinkThumb,
                       let url = URL(string: imgURL) {

                        URLImage(url,
                                 content: {image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })

                        .cornerRadius(10)
                    } else {
                        PlaceHolderImageView()
                    }

                }
                .frame(height: 400)
                .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 25))


                LinearGradient(colors: [
                    .white.opacity(1),
                    .white.opacity(1),
                    .white.opacity(0.9),
                    .white.opacity(0.6),
                    .white.opacity(0.4),
                    .white.opacity(0.3),
                    .white.opacity(0.2),
                    .white.opacity(0.1),
                    .white.opacity(0),
                    .white.opacity(0),
                    .white.opacity(0),
                    .black.opacity(0.1),
                    .black.opacity(0.2),
                    .black.opacity(0.3),
                    .black.opacity(0.4),
                    .black.opacity(0.5),
                ], startPoint: .bottom, endPoint: .top)
                .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 25))

                VStack(alignment: .leading, spacing: 8) {
                    Text(item.strAlcoholic.uppercased())
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Text(item.name)
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .offset(y: currentItem?.id == item.id && animationView ? safeArea().top : 0)
            }
            HStack(spacing: 12) {
                if let imgURL = item.strDrinkThumb,
                   let url = URL(string: imgURL) {

                    URLImage(url,
                             content: {image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                    })
                    .frame(width: 60, height: 60)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                } else {
                    PlaceHolderImageView()
                }


                VStack(alignment: .leading, spacing: 4) {
                    Text(item.name.uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Text(item.strGlass.uppercased())
                        .font(.caption)
                        .foregroundColor(.black)
                }.shadow(color: .black.opacity(0.1), radius: 3, x: 3, y: 3)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)

                Button {
                    viewModel.addToFavourites(drink: item)
                } label: {
                    Image(systemName: viewModel.isDrinkFavourite(drink: item) ? "heart.fill" : "heart")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background{
                            Capsule()
                                .fill(.white)
                        }
                }.shadow(color: .black.opacity(0.1), radius: 3, x: 3, y: 3)
            }
            .padding([.horizontal, .bottom])
        }

        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(.white))
        }
        .matchedGeometryEffect(id: item.id, in: animation)
    }

    //DetailView
    func DetailView(item: DrinksResponse) -> some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                CardView(item: item)
                    .scaleEffect(animationView ? 1 : 0.93)

                VStack(spacing: 15) {
                    Text("Instructions")
                        .padding(.top, 10)
                        .font(.title2)
                    Text(item.strInstructions)
                        .padding()
                        .multilineTextAlignment(.center)


                    Text("Ingredients")
                        .font(.title2)


                HStack{
                    VStack(alignment: .leading){
                        Text(item.strIngredient1 ?? "")
                        Text(item.strIngredient2 ?? "")
                        Text(item.strIngredient3 ?? "")
                    }
                        .foregroundColor(.black)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(item.strMeasure1 ?? "")
                        Text(item.strMeasure2 ?? "")
                        Text(item.strMeasure3 ?? "")
                    }

                        .padding()
                }
                }
                .toolbar(.hidden,for: .tabBar)
                .foregroundColor(.black)
                .offset(y: scrollOffset > 0 ? scrollOffset : 0)
                    .opacity(animationContent ? 1 : 0)
                    .scaleEffect(animationView ? 1 : 0, anchor: .top)
                .padding()
            }
            .offset(y: scrollOffset > 0 ? -scrollOffset: 0)
            .offset(offset: $scrollOffset)
        }
        .coordinateSpace(name: "SCROLL")
        .overlay(alignment: .topTrailing, content: {
            Button {
                //closing view
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    animationView = false
                    animationContent = false
                }
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.05)) {
                    currentItem = nil
                    showDetailPage = false
                }

            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top, safeArea().top)
            .offset(y: -10)
            .opacity(animationView ? 1 : 0)
        })
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                animationView = true
            }
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)) {
                animationContent = true
            }
        }
        .transition(.identity)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(drinks: DrinksResponse.dummyData)
//
//    }
//}
