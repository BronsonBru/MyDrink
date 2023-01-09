//import SwiftUI
//
//struct DetailView: View {
//    @ObservedObject var viewModel = DrinkViewModel()
//
//    @State var currentItem: DrinksResponse?
//    @State var showDetailPage: Bool = false
//    //match geometery
//    @Namespace var animation
//    @State var animationView: Bool = false
//    @State var animationContent: Bool = false
//    @State var scrollOffset: CGFloat = 0
//    var item : DrinksResponse
//    var body: some View {
//
//            ScrollView(.vertical, showsIndicators: false){
//                VStack {
//                    CardView(item: item)
//                        .scaleEffect(animationView ? 1 : 0.93)
//
//                    VStack(spacing: 15) {
//                        Text("Instructions")
//                            .padding(.top, 10)
//                            .font(.title2)
//                        Text(item.strInstructions)
//                            .padding()
//                            .multilineTextAlignment(.center)
//
//
//                        Text("Ingredients")
//                            .font(.title2)
//
//
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text(item.strIngredient1 ?? "")
//                            Text(item.strIngredient2 ?? "")
//                            Text(item.strIngredient3 ?? "")
//                        }
//                            .foregroundColor(.white)
//                            .padding()
//                        VStack(alignment: .leading) {
//                            Text(item.strMeasure1 ?? "")
//                            Text(item.strMeasure2 ?? "")
//                            Text(item.strMeasure3 ?? "")
//                        }
//
//                            .padding()
//                    }
//                    }
//                    .toolbar(.hidden,for: .tabBar)
//                    .foregroundColor(.white)
//                    .offset(y: scrollOffset > 0 ? scrollOffset : 0)
//                        .opacity(animationContent ? 1 : 0)
//                        .scaleEffect(animationView ? 1 : 0, anchor: .top)
//                    .padding()
//                }
//                .offset(y: scrollOffset > 0 ? -scrollOffset: 0)
//                .offset(offset: $scrollOffset)
//            }
//            .coordinateSpace(name: "SCROLL")
//            .overlay(alignment: .topTrailing, content: {
//                Button {
//                    //closing view
//                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
//                        animationView = false
//                        animationContent = false
//                    }
//                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.05)) {
//                        currentItem = nil
//                        showDetailPage = false
//                    }
//
//                } label: {
//                    Image(systemName: "xmark.circle.fill")
//                        .font(.title)
//                        .foregroundColor(.white)
//                }
//                .padding()
//                .padding(.top, safeArea().top)
//                .offset(y: -10)
//                .opacity(animationView ? 1 : 0)
//            })
//            .onAppear {
//                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
//                    animationView = true
//                }
//                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)) {
//                    animationContent = true
//                }
//            }
//            .transition(.identity)
//        }
//    }
//
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(item: DrinksResponse.dummyData)
//    }
//}
