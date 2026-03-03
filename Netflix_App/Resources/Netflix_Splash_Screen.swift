//
//  Netflix_Splash_Screen.swift
//  Mini_Netflix
//
//  Created by Zopping on 26/02/26.

import SwiftUI

struct Netflix_Splash_Screen: View {
    
    let letters = Array("NETFLIX")
    @Binding var showSplash: Bool
    
    @State private var isAnimating = false
    @State private var viewScale: CGFloat = 0.8
    @State private var opacity: Double = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            HStack {
                ForEach(Array(letters.enumerated()), id: \.offset) { index, letter in
                    Text(String(letter))
                        .font(.system(size: 64, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.9, green: 0.05, blue: 0.05),
                                    Color(red: 0.6, green: 0.0, blue: 0.0)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .scaleEffect(isAnimating ? 1 : 0.3)
                        .animation(
                            .spring(response: 0.6, dampingFraction: 0.7)
                                .delay(Double(index) * 0.1),
                            value: isAnimating
                        )
                }
            }
            .scaleEffect(viewScale)
            .opacity(opacity)
        }
        .onAppear {
            
            withAnimation(.easeIn(duration: 0.5)) {
                opacity = 1
                viewScale = 1
            }
            
            isAnimating = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                
                withAnimation(.easeInOut(duration: 0.6)) {
                    viewScale = 2
                    opacity = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    showSplash = false
                }
            }
        }
    }
}
