//
//  ContentView.swift
//  Mini_Netflix
//
//  Created by Zopping on 26/02/26.
//



import SwiftUI

struct ContentView: View {
    
    @State private var showSplash = true
    
    var body: some View {
        if showSplash == true {
            Netflix_Splash_Screen(showSplash: $showSplash)
        } else {
            HomeView()
        }
    }
}
