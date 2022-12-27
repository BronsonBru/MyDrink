//
//  TabBar.swift
//  MyDrink
//
//  Created by Bronson van den Broeck on 2022/12/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
//            HomeView()
//                .tabItem {
//                    Label("Home", systemImage: "house")
//                }

            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }

            NewDrinkView()
                .tabItem {
                    Label("New", systemImage: "plus")
                }

            FavoritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
