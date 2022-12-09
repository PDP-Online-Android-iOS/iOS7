//
//  HomeScreeen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeFeedScreen(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            HomeSearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            HomeUploadScreen(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "camera")
                }.tag(2)
            
            HomeLikesScreen()
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            HomeProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(Utils.color2)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
