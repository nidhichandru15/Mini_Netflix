//
//  MainTabView.swift
//  Netflix_App
//
//  Created by Zopping on 03/03/26.
//

import SwiftUI

struct MainTabView: View{
    //@StateObject private var viewModel = MovieViewModel()
    var body: some View{
        TabView{
            HomeView()
                
                .tabItem{
                    Text("HOME")
                }
            
        
            FavoritesView()
                
                .tabItem{
                    Text("FAV")
                }
        }
        .accentColor(.red)
    }
}
