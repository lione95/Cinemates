//
//  RootTabView.swift
//  Cinemates
//
//  Created by Mattia Golino on 14/11/22.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView{
            Group{
                HomeView().tabItem {
                    Label("Home", systemImage: "house")
                }
                FavoriteView().tabItem {
                    Label("Favorite", systemImage: "heart.fill")
                }
                
                NotificationView().tabItem {
                    Label("Notification", systemImage: "bell.fill")
                }
                
                SearchView().tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                
                ProfileView().tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                
            }.toolbar(.visible, for: .tabBar).toolbarBackground(Color.CineOrange, for: .tabBar).toolbarColorScheme(.light, for: .tabBar).accentColor(Color.CineBlack)

        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
