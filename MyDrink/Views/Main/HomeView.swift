import SwiftUI
import URLImage

struct HomeView: View {
    // animation properties
    @State var currentItem: DummyDrink?
    @State var showDetailPage: Bool = false
    //match geometery
    @Namespace var animation
    @State var animationView: Bool = false
    @State var animationContent: Bool = false
    @State var scrollOffset: CGFloat = 0

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
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
                .padding(.bottom)
                .opacity(showDetailPage ? 0 : 1)


                ForEach(dummyItems) {item in
                    Button {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                            currentItem = item
                            showDetailPage = true

                        }
                    } label: {
                        CardView(item: item)
                        // for matched geometry effect
                            .scaleEffect(currentItem?.id == item.id && showDetailPage ? 1 : 0.93)
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .opacity(showDetailPage ? (currentItem?.id == item.id ? 1 : 0) : 1)
                }
            }
            .padding(.vertical, 5)
        }
        .overlay {
            if let currentItem = currentItem, showDetailPage {
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        .background(alignment: .top) {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(.black))
                .frame(height: animationView ? nil : 350, alignment: .top)
                .opacity(animationView ? 1 : 0)
                .ignoresSafeArea()
        }
    }
    //CardView
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
                    .black.opacity(1),
                    .black.opacity(0.3),
                    .black.opacity(0.25),
                    .black.opacity(0.15),
                    .gray.opacity(0.3),
                    .black.opacity(1),
                ], startPoint: .bottom, endPoint: .top)
                .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 15))

                VStack(alignment: .leading, spacing: 8) {
                    Text(item.drinkName.uppercased())
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Text(item.drinkDescription)
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .offset(y: currentItem?.id == item.id && animationView ? safeArea().top : 0)
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
                        .foregroundColor(.white)

                    Text(item.bannerTitle.uppercased())
                        .font(.caption)
                        .foregroundColor(.white)

                    Text(item.drinkDescription.uppercased())
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)

                Button {

                } label: {
                    Image(systemName: "heart")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
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
                .fill(Color(.black))
        }
        .matchedGeometryEffect(id: item.id, in: animation)
    }

    //DetailView
    func DetailView(item: DummyDrink) -> some View {
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
                        Text(item.strIngredient1)
                        Text(item.strIngredient2)
                        Text(item.strIngredient3)
                    }
                        .foregroundColor(.white)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(item.strMeasure1)
                        Text(item.strMeasure2)
                        Text(item.strMeasure3)
                    }

                        .padding()
                }
                }
                .toolbar(.hidden,for: .tabBar)
                .foregroundColor(.white)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()

    }
}


//scaled button Style
struct ScaledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}


// safe are value
extension View {
    func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }

    //scrollview offset
    func offset(offset: Binding<CGFloat>)-> some View {
        return self
            .overlay {
                GeometryReader{ proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY

                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self) { value in
                    offset.wrappedValue = value
                }
            }
    }
}

//offset key
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }

}
