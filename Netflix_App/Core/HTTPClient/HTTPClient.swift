//
//  HTTPClient.swift
//  Netflix_App
//
//  Created by HarshaZopping on 03/03/26.
//

import Foundation

class HTTPClient {
	func fetchMovies() async {
		guard let url = URL(string: selectedCategory.urlString) else {
			return
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
			movies = decoded.results
		} catch {
			print("Error fetching movies:", error)
		}
	}
}
