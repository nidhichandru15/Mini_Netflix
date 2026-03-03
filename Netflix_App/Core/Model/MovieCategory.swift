//
//  MovieCategory.swift
//  Mini_Netflix
//
//  Created by Zopping on 03/03/26.
//

import Foundation

enum MovieCategory: String, CaseIterable {
    
    case popular = "Popular"
    case topRated = "Top Rated"
    case upcoming = "Upcoming"
    case nowPlaying = "Now Playing"
    
    var urlString: String {
        let apiKey = "6fbacc83f3de83353fe967ae38866a36"
        
        switch self {
        case .popular:
            return "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
            
        case .topRated:
            return "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)"
            
        case .upcoming:
            return "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)"
            
        case .nowPlaying:
            return "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)"
        }
    }
}
