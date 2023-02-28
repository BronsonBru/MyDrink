import SwiftUI

struct ContentView: View {
//    @ObservedObject var favourites = Favourites()
    var body: some View {
    
        TabBar()
//            .environmentObject(favourites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
