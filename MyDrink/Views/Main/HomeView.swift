//
//  HomeView.swift
//  MyDrink
//
//  Created by Bronson van den Broeck on 2022/12/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("My Drink!")
                .navigationTitle("My Drink!")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
