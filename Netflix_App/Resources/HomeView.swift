//
//  HomeView.swift
//  Mini_Netflix
//
//  Created by Zopping on 02/03/26.
//

import SwiftUI
import Combine
import Foundation

struct HomeView: View {
    
    @StateObject private var viewModel = MovieViewModel()
    @State private var username = "Nidhi"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
               
                HStack {
                    Text("Hi \(username)")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "bell")
                        .font(.title2)
                    
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                }
                .padding()
                
            
                TextField("Search movies...", text: $viewModel.searchText)
					.foregroundStyle(.white)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
              
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(MovieCategory.allCases, id: \.self) { category in
                            Button {
                                viewModel.selectedCategory = category
                                Task {
                                    await viewModel.fetchMovies()
                                }
                            } label: {
                                Text(category.rawValue)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        viewModel.selectedCategory == category ?
                                        Color.red : Color.gray.opacity(0.3)
                                    )
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 5)
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.filteredMovies) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                                    .environmentObject(viewModel)
                            } label: {
                                HStack {
                                    
                                    AsyncImage(url: movie.posterURL) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 90, height: 130)
                                    .clipped()
                                    .cornerRadius(8)
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(movie.title)
                                            .bold()
                                        
                                        Text("\(movie.vote_average, specifier: "%.1f")")
                                            .font(.caption)
                                    }
                                    .foregroundColor(.white)
                                    
                                    Spacer()
                                    
//                                    Image(systemName: viewModel.isFavorite(movie) ? "heart.fill" : "heart")
//                                        .foregroundColor(.red)
//
//                                        .font(.title2)
                                    
                                    Button {
                                        viewModel.toggleFavorite(for: movie)
                                    } label: {
                                        Image(systemName: viewModel.isFavorite(movie) ? "heart.fill" : "heart")
                                            .foregroundColor(.red)
                                            .font(.title2)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .background(Color.black.ignoresSafeArea())
            .foregroundColor(.white)
            .task {
                await viewModel.fetchMovies()
            }
        }
    }
}

