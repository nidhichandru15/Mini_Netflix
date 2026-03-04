//
//  HTTPClient.swift
//  Netflix_App
//
//  Created by HarshaZopping on 03/03/26.
//

import Foundation

class HTTPClient {
    func fetchMovies(category: MovieCategory)  async throws -> [Movie]{
        guard let url = URL(string: category.urlString) else {
            //return
            throw URLError(.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
            
            //            print( decoded.results)
            //	 catch {
            //			print("Error fetching movies:", error)
            //		}
            return decoded.results
        }}
}

