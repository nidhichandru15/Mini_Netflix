//
//  Movie.swift
//  Mini_Netflix
//
//  Created by Zopping on 02/03/26.


import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let vote_average: Double
    
    var posterURL: URL? {
        guard let path = poster_path else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
