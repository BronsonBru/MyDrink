//import SwiftUI
//import URLImage
//
//struct HomeView: View {
//    @StateObject var viewModel = DrinksViewModelImpl(service: DrinksServiceImpl())
//
//    var body: some View {
//        Group {
//            switch viewModel.state {
//            case .loading:
//                ProgressView()
//            case.failed(let error):
//                ErrorView(error: error, handler: viewModel.getDrinks)
//            case .success(let drinks):
//                NavigationView {
//                    List(drinks) { item in
//                        DrinksView(drinks: item)
//                    }
//                    .navigationTitle(Text("Drinks"))
//                }
//            }
//        }.onAppear(perform: viewModel.getDrinks)
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
