//
//  MovieViewModel.swift
//  Mini_Netflix
//
//  Created by Zopping on 02/03/26.
//

//import SwiftUI
//import Combine
//import Foundation
//
//enum MovieCategory: String, CaseIterable {
//    case popular = "Popular"
//    case topRated = "Top Rated"
//    case upcoming = "Upcoming"
//    case nowPlaying = "Now Playing"
//    case trending = "Trending"
//}
//
//@MainActor
//class MovieViewModel: ObservableObject {
//
//    @Published var movies: [Movie] = []
//    @Published var searchText: String = ""
//    @Published var selectedCategory: MovieCategory = .popular
//
//    private let apiKey = "6fbacc83f3de83353fe967ae38866a36"
//
//    func fetchMovies() async {
//
//        let endpoint: String
//
//        switch selectedCategory {
//        case .popular:
//            endpoint = "movie/popular"
//        case .topRated:
//            endpoint = "movie/top_rated"
//        case .upcoming:
//            endpoint = "movie/upcoming"
//        case .nowPlaying:
//            endpoint = "movie/now_playing"
//        case .trending:
//            endpoint = "trending/movie/day"
//        }
//
//        guard let url = URL(string:
//            "https://api.themoviedb.org/3/\(endpoint)?api_key=\(apiKey)"
//        ) else { return }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
//            movies = decoded.results
//        } catch {
//            print("Error:", error)
//        }
//    }
//
//    var filteredMovies: [Movie] {
//        if searchText.isEmpty {
//            return movies
//        } else {
//            return movies.filter {
//                $0.title.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
//}


import Foundation
import Combine
import SwiftUI

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var searchText: String = ""
    
    @Published var selectedCategory: MovieCategory = .popular
    
   
    @Published var favoriteMovieIDs: Set<Int> = []
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    func fetchMovies() async {
        guard let url = URL(string: selectedCategory.urlString) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
            movies = decoded.results
        } catch {
            print("Api Error", error)
        }
    }
    

    
    func toggleFavorite(for movie: Movie) {
        if favoriteMovieIDs.contains(movie.id) {
            favoriteMovieIDs.remove(movie.id)
        } else {
            favoriteMovieIDs.insert(movie.id)
        }
    }
    
  
    func isFavorite(_ movie: Movie) -> Bool {
        favoriteMovieIDs.contains(movie.id)
    }
   
        
    
    
    
    
}


