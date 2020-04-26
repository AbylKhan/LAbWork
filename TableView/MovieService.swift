//
//  MovieService.swift
//  TableView
//
//  Created by Abylaikhan Koshanov on 4/11/20.
//  Copyright © 2020 Abylaikhan Koshanov. All rights reserved.
//

import Foundation

class MovieService {
    
    static let shared = MovieService()
    
    
    func downloadMovies(completion: @escaping (DownloadFilmsResponse) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?apikey=eb193138&s=evil&r=json") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DownloadFilmsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    class DownloadFilmsResponse: Codable {
        var movies: [Movie]
        var totalResults: String
        
        enum CodingKeys: String, CodingKey {
            case movies = "Search"
            case totalResults
        }
    }
}
