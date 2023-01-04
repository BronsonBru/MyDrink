//import SwiftUI
//
//struct RandomCocktailView: View {
//    @ObservedObject private var viewModel = RandomCocktailViewModel()
//
//    var body: some View {
//        VStack {
//            Text(viewModel.cocktail.name)
//            Button(action: viewModel.loadCocktail) {
//                Text("Show Another")
//            }
//        }
//        .onAppear(perform: viewModel.loadCocktail)
//        .alert(item: $viewModel.error) { error in
//            Alert(title: Text("Error"), message: Text(error), dismissButton: .default(Text("OK")))
//        }
//    }
//}
//
//class RandomCocktailViewModel: ObservableObject {
//    @Published var cocktail: Cocktail = Cocktail(id: "", name: "")
//        @Published var error: String? = nil
//
//    func loadCocktail() {
//        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")!
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    self.error = error.localizedDescription
//                }
//                return
//            }
//
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    self.error = "No data"
//                }
//                return
//            }
//
//            let decoder = JSONDecoder()
//            if let decodedResponse = try? decoder.decode(CocktailResponse.self, from: data) {
//                DispatchQueue.main.async {
//                    self.cocktail = decodedResponse.cocktail
//                }
//                return
//            }
//
//            DispatchQueue.main.async {
//                self.error = "Failed to decode response"
//            }
//        }.resume()
//    }
//}
//
//struct CocktailResponse: Decodable {
//    var cocktail: Cocktail
//}
//
//struct Cocktail: Decodable {
//    var id: String
//    var name: String
//}
//
//struct ErrorMessage: Identifiable {
//    var id: String { message }
//    var message: String
//}
