
//
//  MovieDetail.swift
//  Mini_Netflix
//
//  Created by Zopping on 02/03/26.
//


import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 400)
                .clipped()
                
                HStack {
                    Text(movie.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        viewModel.toggleFavorite(for: movie)
                    } label: {
                        Image(systemName: viewModel.isFavorite(movie) ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .font(.title2)
                    }
                }
                
                Text("\(movie.vote_average, specifier: "%.1f")")
                    .font(.headline)
                
                Text(movie.overview)
                    .font(.body)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
