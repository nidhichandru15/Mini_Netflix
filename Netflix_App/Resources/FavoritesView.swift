//
//  FavouritesView.swift
//  Netflix_App
//
//  Created by Zopping on 03/03/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    
    var favoriteMovies: [Movie] {
        viewModel.movies.filter {
            viewModel.favoriteMovieIDs.contains($0.id)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if favoriteMovies.isEmpty {
                    Text("No Favorites Marked")
                        .font(.title2)
                        .foregroundColor(.blue)
                } else {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(favoriteMovies) { movie in
                                
                                NavigationLink {
                                    MovieDetailView(movie: movie)
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
                                        
                                        VStack(alignment: .leading) {
                                            Text(movie.title)
                                                .bold()
                                            
                                            Text(" \(movie.vote_average, specifier: "%.1f")")
                                                .font(.caption)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.black.ignoresSafeArea())
            .foregroundColor(.white)
            .navigationTitle("Favorites")
        }
    }
}
